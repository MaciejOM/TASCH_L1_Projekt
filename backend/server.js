const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const server = express();

const bcrypt = require("bcrypt");
const saltRounds = 10;

const jwt = require('jsonwebtoken');
const SECRET_KEY = '9ceda9f0ef0f93bc3bde94dec2a354e34df4461ab0644ae381e2655019afbb4d';

server.use(cors());
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

// --- POPRAWKA: Konfiguracja bazy jest teraz globalna ---
const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'FilmRev'
};
// -------------------------------------------------------

const swaggerJsdoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

// DOKUMENTACJA SWAGGER
const swaggerOptions = {
    definition: {
        openapi: "3.0.0",
        info: {
            title: "FilmRev-API",
            version: "1.0.0",
            description: "Documentation for the FilmRev-API - REST API for managing movie reviews.",
        },
        servers: [
            {
                url: "http://localhost:3001",
                description: "Local Server"
            }
        ]
    },
    apis: ["./server.js"],
};

const specs = swaggerJsdoc(swaggerOptions);
server.use("/api-docs", swaggerUi.serve, swaggerUi.setup(specs));

// PORT I SŁUCHANIE SERWERA
const PORT = process.env.PORT || 3001;

server.listen(PORT, () => {
    console.log("Serwer działa na PORCIE:", PORT);
});

// STATUS SERWERA
server.get('/status', (req, res) => {
    res.json({ Status: "Running" });
});

// LOGOWANIE 
server.get('/logowanie/:email/:haslo', (req, res) => {
    // Używamy globalnego dbConfig
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    const email = req.params.email;
    const password = req.params.haslo;

    connection.query(`SELECT haslo FROM uzytkownicy WHERE email = ?`, [email], (err, rows) => {
        if (err) {
            console.error("Błąd przy pobieraniu hasła:", err);
            res.status(500).json({ error: "Błąd serwera przy pobieraniu danych użytkownika." });
            return connection.end();
        }

        let wynik = JSON.parse(JSON.stringify(rows));

        if (!wynik[0]) {
            res.status(400).json({ error: "Nie znaleziono użytkownika o podanym adresie email." });
            return connection.end();
        }

        bcrypt.compare(password, wynik[0].haslo, function (err, result) {
            if (err) {
                console.error("Błąd przy porównywaniu haseł:", err);
                res.status(500).json({ error: "Błąd serwera podczas porównywania haseł." });
                return connection.end();
            }

            if (!result) {
                res.status(401).json({ error: "Nieprawidłowe hasło." });
                return connection.end();
            }

            connection.query(`SELECT id, nazwa_uzytkownika FROM uzytkownicy WHERE email = ?`, [email], (err, rows) => {
                if (err) {
                    console.error("Błąd przy pobieraniu danych użytkownika:", err);
                    res.status(500).json({ error: "Błąd serwera przy pobieraniu danych użytkownika." });
                } else {
                    const dane = JSON.parse(JSON.stringify(rows));
                    const userData = dane[0];

                    const token = jwt.sign(
                        { id: userData.id, nazwa: userData.nazwa_uzytkownika },
                        SECRET_KEY,
                        { expiresIn: '1d' }
                    );

                    res.status(200).json({
                        user: userData,
                        token: token
                    });
                }
                connection.end();
            });
        });
    });
});

// WERYFIKACJA TOKENA JWT
function verifyToken(req, res, next) {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (!token) return res.status(403).json({ error: "Brak tokena" });

    jwt.verify(token, SECRET_KEY, (err, user) => {
        if (err) return res.status(403).json({ error: "Nieprawidłowy token" });
        req.user = user;
        next();
    });
}

// REJESTRACJA
server.post('/rejestracja', async (req, res) => {
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    const { login, mail, haslo, captchaToken } = req.body;

    if (!req.body || !req.body.login || !req.body.haslo || !req.body.mail || !req.body.captchaToken) {
        connection.end();
        return res.status(400).json({ error: "Brak wymaganych danych rejestracyjnych." });
    }
    
    try {
        const secret = '6Lca9FYrAAAAAFPjANNTBlMBYUOEUrWHNhz5l3u0';
        // Uwaga: W Node 18 fetch jest natywny, w starszych wymaga node-fetch
        const captchaRes = await fetch(`https://www.google.com/recaptcha/api/siteverify`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `secret=${secret}&response=${captchaToken}`
        });

        const captchaData = await captchaRes.json();

        if (!captchaData.success) {
            connection.end();
            return res.status(400).json({ error: "Nieprawidłowa CAPTCHA. Spróbuj ponownie." });
        }

        bcrypt.hash(haslo, saltRounds, (err, hash) => {
            if (err) {
                connection.end();
                return res.status(500).json({ error: "Błąd szyfrowania hasła" });
            }

            connection.query(
                `INSERT INTO uzytkownicy(nazwa_uzytkownika, email, haslo) VALUES(?, ?, ?)`,
                [login, mail, hash],
                (err) => {
                    connection.end();
                    if (err) return res.status(500).json({ error: "Błąd rejestracji użytkownika" });
                    // W Dockerze przekierowanie na localhost:3000 (frontend) zadziała tylko w przeglądarce użytkownika
                    res.redirect("http://localhost:3000");
                }
            );
        });

    } catch (err) {
        connection.end();
        console.error("Błąd podczas weryfikacji CAPTCHA:", err);
        return res.status(500).json({ error: "Błąd serwera przy weryfikacji CAPTCHA" });
    }
});

// IMPORT GATUNKÓW
const url_gatunki = 'https://api.themoviedb.org/3/genre/movie/list?language=pl';
const options_gatunki = {
    method: 'GET',
    headers: {
        accept: 'application/json',
        Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZjE4YjA3ZDlhYWNlNDA4ZWQ2M2ZjZjliZDdhMTI0OSIsIm5iZiI6MTc0OTIxMjMyMi42NjUsInN1YiI6IjY4NDJkY2EyYjMwMzA2ZjY1N2YyY2FjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kb5r4wR4rO1WNE5_sDsa9jGPKMfj6dHiLf0i0PD3nUA'
    }
};

// Opóźniamy start importu o 15 sekund, żeby baza zdążyła wstać w Dockerze
setTimeout(() => {
    console.log("Rozpoczynam pobieranie danych z TMDB...");
    
    fetch(url_gatunki, options_gatunki)
        .then(res => res.json())
        .then(json => {
            const connection = mysql.createConnection(dbConfig);
            // Obsługa błędu połączenia, żeby nie wywaliło serwera
            connection.on('error', err => {
                console.error("Błąd połączenia z DB przy imporcie gatunków (MySQL może jeszcze wstawać):", err.code);
            });
            connection.connect(err => {
                if (err) {
                    console.error("Nie udało się połączyć z bazą (gatunki):", err.code);
                    return;
                }
                
                if(json.genres) {
                    json.genres.forEach(g => {
                        connection.query(`REPLACE INTO gatunki(id, gatunek) VALUES(?, ?)`, [g.id, g.name], err => {
                            if (err) console.error(err);
                        });
                    });
                    console.log("Zaktualizowano gatunki filmów!");
                }
                connection.end();
            });
        })
        .catch(err => console.error("Błąd importu gatunków filmów:", err));

    // IMPORT FILMÓW
    const url2 = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&language=pl-PL';
    const options2 = {
        method: 'GET',
        headers: {
            accept: 'application/json',
            Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZjE4YjA3ZDlhYWNlNDA4ZWQ2M2ZjZjliZDdhMTI0OSIsIm5iZiI6MTc0OTIxMjMyMi42NjUsInN1YiI6IjY4NDJkY2EyYjMwMzA2ZjY1N2YyY2FjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kb5r4wR4rO1WNE5_sDsa9jGPKMfj6dHiLf0i0PD3nUA'
        }
    };

    fetch(url2, options2)
        .then(res => res.json())
        .then(json => json.results)
        .then(filmy => {
            const connection = mysql.createConnection(dbConfig);
            connection.on('error', err => {
                console.error("Błąd połączenia z DB przy imporcie filmów:", err.code);
            });
            connection.connect(err => {
                if(err) return;

                if(filmy) {
                    filmy.forEach(film => {
                        const id_filmu = film.id;
                        const nazwa = film.title;
                        const rok_prod = film.release_date;
                        const plakat = film.poster_path;
                        const tlofilmu = film.backdrop_path;
                        const opis = film.overview;
                        const gatunki = film.genre_ids;

                        if(gatunki) {
                            gatunki.forEach(gatunek => {
                                connection.query(`REPLACE INTO gatunki_filmu(id_filmu, id_gatunku) VALUES(?, ?)`, [id_filmu, gatunek], (err) => {
                                    if (err) console.error("Błąd przy zapisie gatunku:", err);
                                });
                            });
                        }

                        connection.query(
                            `REPLACE INTO film(id, nazwa, rok, overview, plakat, backdrop) VALUES(?, ?, ?, ?, ?, ?)`,
                            [
                                id_filmu,
                                nazwa,
                                rok_prod,
                                opis,
                                `https://image.tmdb.org/t/p/w500${plakat}`,
                                `https://image.tmdb.org/t/p/original${tlofilmu}`
                            ],
                            (err) => {
                                if (err) console.error("Błąd przy zapisie filmu:", err);
                            }
                        );
                    });
                    console.log("Zaktualizowano bazę danych filmów");
                }
                connection.end();
            });
        })
        .catch(err => console.error("Błąd podczas pobierania filmów:", err));

}, 25000);


// POBIERANIE FILMÓW
server.get('/filmy', (req, res) => {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 12;
    const offset = (page - 1) * limit;

    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    connection.query("SELECT COUNT(*) AS total FROM widok_filmy", (err, countResult) => {
        if (err) {
            // --- DODANO LOGOWANIE BŁĘDU ---
            console.error("BŁĄD SQL (COUNT):", err); 
            // -----------------------------
            connection.end();
            return res.status(500).json({ error: "Błąd zliczania filmów" });
        }

        const totalItems = countResult[0].total;
        const totalPages = Math.ceil(totalItems / limit);

        connection.query(
            "SELECT id_filmu, tloFilmu , plakat, nazwa, gatunki,opis, srednia_ocen, DATE_FORMAT(rok, '%Y-%m-%d') AS rok FROM widok_filmy ORDER BY rok DESC LIMIT ? OFFSET ?",
            [limit, offset],
            (err, rows) => {
                connection.end();
                if (err) {
                    // --- DODANO LOGOWANIE BŁĘDU ---
                    console.error("BŁĄD SQL (SELECT):", err);
                    // -----------------------------
                    return res.status(500).json({ error: "Błąd pobierania filmów" });
                }

                res.json({
                    data: rows,
                    pagination: {
                        currentPage: page,
                        totalPages,
                        totalItems
                    }
                });
            }
        );
    });
});

// POBIERANIE UŻYTKOWNIKA
server.get('/user/:id', (req, res) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).json({ error: 'Brak tokena uwierzytelniającego' });
    }

    jwt.verify(token, SECRET_KEY, (err, decoded) => {
        if (err) {
            return res.status(403).json({ error: 'Nieprawidłowy token' });
        }

        const userId = req.params.id;
        const connection = mysql.createConnection(dbConfig);
        connection.connect();

        connection.query(
            `SELECT id, nazwa_uzytkownika FROM uzytkownicy WHERE id = ?`,
            [userId],
            (err, rows) => {
                connection.end();
                if (err) return res.status(500).json({ error: "Błąd bazy danych" });
                res.json(rows);
            }
        );
    });
});

// POBIERANIE RECENZJE
server.get('/recenzje/:id', (req, res) => {
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    const sql = `
        SELECT R.id_uzytkownika AS id, R.id AS recenzje_id, U.nazwa_uzytkownika, R.tresc, R.ocena 
        FROM recenzje R 
        JOIN uzytkownicy U ON U.id = R.id_uzytkownika 
        JOIN film F ON F.id = R.id_filmy 
        WHERE F.id = ?`;

    connection.query(sql, [req.params.id], (err, rows) => {
        connection.end();
        if (err) return res.status(500).json({ error: "Błąd pobierania recenzji" });
        res.json(rows);
    });
});

// POBIERANIE POJEDYNCZĄ RECENZJE
server.get('/SingleRecenzja/:id', (req, res) => {
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    const sql = `
        SELECT R.id_uzytkownika AS id, R.id AS recenzje_id, U.nazwa_uzytkownika, R.tresc, R.ocena 
        FROM recenzje R 
        JOIN uzytkownicy U ON U.id = R.id_uzytkownika 
        JOIN film F ON F.id = R.id_filmy 
        WHERE R.id = ?`;

    connection.query(sql, [req.params.id], (err, rows) => {
        connection.end();
        if (err) return res.status(500).json({ error: "Błąd pobierania recenzji" });
        res.json(rows);
    });
});

// DODAWANIE RECENZJI
server.post('/stworz', verifyToken, (req, res) => {
    const { film_id, user_id, recenzja, ocena } = req.body;
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    connection.query(
        `INSERT INTO recenzje(id_filmy, id_uzytkownika, tresc, ocena) VALUES(?, ?, ?, ?)`,
        [film_id, user_id, recenzja, ocena],
        (err) => {
            connection.end();
            if (err) return res.status(500).json({ error: "Błąd dodawania recenzji" });
            res.redirect("http://localhost:3000");
        }
    );
});

// EDYTOWANIE RECENZJI
server.put('/edytuj/:id_rec', verifyToken, (req, res) => {
    const { id_rec } = req.params;
    const { tresc, ocena } = req.body;
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    connection.query(
        `UPDATE recenzje SET tresc = ?, ocena = ? WHERE id = ?`,
        [tresc, ocena, id_rec],
        (err) => {
            connection.end();
            if (err) return res.status(500).json({ error: "Błąd edycji recenzji" });
            res.json({ message: "Zaktualizowano recenzję" });
        }
    );
});

// USUWANIE RECENZJI
server.delete('/usun/:uzytkownik/:recenzja', (req, res) => {
    const { recenzja, uzytkownik } = req.params;
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    connection.query(
        `DELETE FROM recenzje WHERE id = ? AND id_uzytkownika = ?`,
        [recenzja, uzytkownik],
        (err) => {
            connection.end();
            if (err) return res.status(500).json({ error: "Błąd usuwania recenzji" });
            res.redirect("http://localhost:3000");
        }
    );
});

server.use((req, res) => {
    res.status(404).json({ error: "Nie znaleziono takiej trasy" });
});

server.use((err, req, res, next) => {
    console.error("Wewnętrzny błąd serwera:", err.stack);
    res.status(500).json({ error: "Wewnętrzny błąd serwera" });
});