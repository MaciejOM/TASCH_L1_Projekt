import ReactDOM from 'react-dom';
import { render } from 'react-dom';
import './App.css';
import { createRoot } from 'react-dom/client';
import { useEffect, useState, createElement } from 'react';
import { CookiesProvider, useCookies } from 'react-cookie';
import { useRef, createRef } from 'react';
import ReCAPTCHA from "react-google-recaptcha";


// useState'y

function App() {

    const [user, setUser] = useState(null);                 // Przechowuje aktualnie zalogowanego użytkownika.

    const [currentFilm, setCurrentFilm] = useState([]);     // Przechowuje aktualnie wybrany film.

    const [filmy, setFilmy] = useState([]);                 // Przechowuje dane z tabeli 'Filmy'.

    const [recenzje, setRecenzje] = useState([]);           // Przechowuje dane z tabeli 'Recenzje'.

    const [cookies, setCookies] = useCookies(['user']);     //Przechowuje plik cookies użytkownika.

    const recaptchaRef = useRef();                          // Przechowuje referencje do captchy.

    const [Strona, setStrona] = useState(1);                // Przechowuje stornę, która wyświetli się po włączeniu strony.

    const [totalPages, setTotalPages] = useState(0);        // Przechowuje całkowitą ilość stron (Domyślnie: 0).



    // Ustawia aktualnie zalogowanego użytkownika

    useEffect(() => {

            if(Number.isInteger(cookies.user)) {
                fetchUser(cookies.user);
            }


    }, []);

    // Pobiera aktualnie wyświetlany film i odsyła jego recenzje

    useEffect(() => {
        if (currentFilm && currentFilm.id_filmu) {
            fetch(`http://localhost:3001/recenzje/${currentFilm.id_filmu}`)
            .then(res => {
                if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
                return res.json();
            })
            .then(data => {
                setRecenzje(data);
            })
            .catch(err => {
                console.error("Błąd przy pobieraniu recenzji:", err);
                alert("Nie udało się załadować recenzji.");
            });
        }
    }, [currentFilm]);

    // wyciąga dane użytkownika

    async function fetchUser(id) {
        const token = localStorage.getItem('token');

        fetch(`http://localhost:3001/user/${id}`, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        })
        .then(res => {
            if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
            return res.json();
        })
        .then(data => {
            setUser(data);
        })
        .catch(err => {
            console.error("Błąd przy pobieraniu użytkownika:", err);
            alert("Nie udało się pobrać danych użytkownika.");
        });
    }

    // Funcjonalność pop-up'u z recenzjami

    function pokazRecenzje() {

            const pop_up_log = document.body.querySelector('.pop-up');
            pop_up_log.classList.remove("hidden"); 
            

    }

    function ukryjRecenzje(){
       
        const pop_up_log = document.body.querySelector('.pop-up');
        pop_up_log.classList.add("hidden"); 

    }

    // Tworzenie stron na liście filmów
   
    useEffect(() => {
    const filmyNaStronie = 12;

    fetch(`http://localhost:3001/filmy?page=${Strona}&limit=${filmyNaStronie}`)
        .then(res => {
            if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
            return res.json();
        })
        .then(response => {
            setFilmy(response.data);
            setTotalPages(response.pagination.totalPages);
        })
        .catch(err => {
            console.error("Błąd przy pobieraniu filmów:", err);
            alert("Nie udało się pobrać listy filmów.");
        });
    }, [Strona]);

    //RECENZJE
    
    // Tworzenie elementu do tworzenia recenzji, jeżeli użytkownik jest zalogowany

        function StworzRecenzje() {
        if (!user) {
            return (
                <div className="LoginReq">
                    <p>Musisz się zalogować, aby napisać recenzję.</p>
                </div>
            );
        } else {

            const handleSubmit = async (event) => {
                event.preventDefault();

                const recenzja = document.getElementById('recenzja').value.trim();
                const ocenaChecked = document.querySelector('input[name="ocena"]:checked');

                if (!recenzja) {
                    alert("Proszę napisz treść recenzji.");
                    return;
                }

                if (!ocenaChecked) {
                    alert("Proszę wybierz ocenę filmu.");
                    return;
                }

                const token = cookies.token;
                if (!token) {
                    alert("Brak tokena autoryzacji.");
                    return;
                }

                const body = {
                    user_id: cookies.user,
                    film_id: currentFilm.id_filmu,
                    recenzja: recenzja,
                    ocena: ocenaChecked.value
                };

                try {
                    const res = await fetch("http://localhost:3001/stworz", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "Authorization": `Bearer ${token}`
                        },
                        body: JSON.stringify(body)
                    });

                    if (!res.ok) {
                        const err = await res.json();
                        throw new Error(err.error || "Nie udało się dodać recenzji.");
                    }

                    alert("Recenzja dodana pomyślnie!");
                    window.location.reload();

                } catch (err) {
                    console.error("Błąd podczas dodawania recenzji:", err);
                    alert(err.message || "Wystąpił błąd.");
                }
            };

            return (
                <form className="stworzRecenzje">
                    <input type="hidden" name="user_id" value={cookies.user} />
                    <input type="hidden" name="film_id" value={currentFilm.id_filmu} />

                    <textarea id="recenzja" name="recenzja" placeholder="Napisz co myślisz o tym filmie!" rows="5"></textarea>

                    <div className="OcenaFilmu">
                        <p>Ocena:</p>

                        <div className="gwiazdki-ocena">
                            <input type="radio" id="ocena5" name="ocena" value="5" /><label htmlFor="ocena5" title="Rewelacyjny">★</label>
                            <input type="radio" id="ocena4" name="ocena" value="4" /><label htmlFor="ocena4" title="Bardzo dobry">★</label>
                            <input type="radio" id="ocena3" name="ocena" value="3" /><label htmlFor="ocena3" title="Dobry">★</label>
                            <input type="radio" id="ocena2" name="ocena" value="2" /><label htmlFor="ocena2" title="Słaby">★</label>
                            <input type="radio" id="ocena1" name="ocena" value="1" /><label htmlFor="ocena1" title="Bardzo słaby">★</label>
                        </div>

                        <br />
                        <div className="Guzik">
                            <button type="button" id="stworz_rec" onClick={handleSubmit}>OPUBLIKUJ RECENZJĘ</button>
                        </div>
                    </div>
                </form>
            );
        }
    }
    
    
    // Tworzenie elemantu do edycji i usuwania recenzji, jeżeli aktualny użytkownik jest jej autorem
    
        function StworzPrzycisk({ wlasciciel, recenzja }) {
    
                if (cookies.user == wlasciciel) {
    
                return (
    
                    <div className="przyciski">
    
                        <button id="EdytujRec" type="button" onClick={() => EdytujRec(recenzja)}>EDYTUJ RECENZJĘ</button>
                        <button id="UsunRec" type="button" onClick={() => UsunRec(cookies.user, recenzja)}>USUŃ RECENZJĘ</button>
    
                    </div>
    
                );
                }
    
            
        }
    

    // Usuwanie recenzji użytkownika, jeśli jest jej autorem
    
    function UsunRec(user, rec_id){

            let text = "Czy na pewno chcesz usunąć recenzję?\nDziałania nie można cofnąć!"
            if(window.confirm(text) == true) {
                fetch(`http://localhost:3001/usun/${user}/${rec_id}`, {method: "DELETE"})
                .then((res) => {
                    window.location.reload();
                })
                .catch(err => {
                    console.error("Błąd przy usuwaniu recenzji:", err);
                    alert("Nie udało się usunąć recenzji.");
                });
            }else {}
            
    
    
        }


    // edytowanie recenzji użytkownika, jeśli jest jej autorem
    
    
    function EdytujRec(rec_id) {
    fetch(`http://localhost:3001/SingleRecenzja/${rec_id}`)
        .then(res => {
            if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
            return res.json();
        })
        .then(data => {
            let res = data[0];

            const tresc = res.tresc;
            const ocena = res.ocena;

            const input_tresc = document.getElementById('recenzja');
            const input_ocena = document.getElementsByName('ocena');
            const submit_btn = document.getElementById('stworz_rec');
            const edit_btn_old = document.getElementById('EdytujRec')

            input_tresc.value = tresc;
            input_ocena.forEach(input => {
                if(input.value == ocena) {
                    input.checked = true;
                }
            });

            submit_btn.remove();


            const form = createRoot(
                document.querySelector('.Guzik')
            );

            const Edit_btn = <button type="button" onClick={() => SubmitEdit(rec_id)}>ZATWIERDŹ EDYCJĘ</button>;

            form.render(Edit_btn);

            input_tresc.scrollIntoView({ behavior: 'smooth', block: 'center' });
            input_tresc.focus();
        })
        .catch(err => {
            console.error("Błąd przy pobieraniu recenzji do edycji:", err);
            alert("Nie udało się załadować recenzji do edycji.");
        });
    }

    // Zatwierdzenie edycji recenzji użytkownika

    function SubmitEdit(id_rec) {
        const input_tresc = document.getElementById('recenzja');
        const nowa_tresc = input_tresc.value.trim();

        const ocena_checked = document.querySelector('input[name="ocena"]:checked');
        const nowa_ocena = ocena_checked ? ocena_checked.value : null;

        const token = localStorage.getItem("token");

        if (!nowa_tresc) {
                    alert("Proszę napisz treść recenzji.");
                    return;
                }

        fetch(`http://localhost:3001/edytuj/${id_rec}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify({
                tresc: nowa_tresc,
                ocena: nowa_ocena
            })
        })
        .then(res => {
            if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
            return res.json();
        })
        .then(() => {
            window.location.reload();
        })
        .catch(err => {
            console.error("Błąd przy edytowaniu recenzji:", err);
            alert("Nie udało się edytować recenzji.");
        });
    }


    //Użytkownik

    // Fukncjonowanie pop-up z logowanie i rejestracją

    function pokazLogowanie() {

            const pop_up_log = document.body.querySelector('.pop-up-log');
            pop_up_log.classList.remove("hidden");  // Pokazywanie pop-up'u po kliknięciu "Zaloguj się"

    }

    function ukryjLogowanie(){
       
        const pop_up_log = document.body.querySelector('.pop-up-log');
        pop_up_log.classList.add("hidden");  // Pokazywanie pop-up'u po kliknięciu "Zaloguj się"

    }

    // Sprawdzenie, czy jakikolwiek użytkownik jest aktualnie zalogowany. Jeśli nie, wyświetlaj opcję zalogowanie się

    function LoginCheck() {

        if (!user) {
                return (
                    <div className="Niezalogowany" onClick={pokazLogowanie}>
                        <p> ZALOGUJ SIĘ</p>
                    </div>
                )
            }
    
            else {
                    return (
                        user.map((data) => {
                        return (
                            
                            <div className="Zalogowany">
                                <p> Zalogowany jako: <br/>{data.nazwa_uzytkownika}</p>
                                    <input type='button' Value="Wyloguj się" onClick={Wylogowywanie}></input>
                            </div>

                        )

                    })
                    )
            }
    }


    // Funkcja logowania użytkownika

    async function logowanie() {
    const email = document.getElementById('logEmail').value;
    const haslo = document.getElementById('logPass').value;

    fetch(`http://localhost:3001/logowanie/${email}/${haslo}`)
        .then(res => {
            if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
            return res.json();
        })
        .then(data => {
            const res = data;
            if (!res || !res.token || !res.user) throw new Error("Niepoprawne dane logowania.");

            const id_uzytkownika = res.user.id;
            const token = res.token;

            setCookies('user', id_uzytkownika, { path: '/', maxAge: 86400 }); 
            setCookies('token', token, { path: '/', maxAge: 86400 });

            localStorage.setItem("token", token);

            window.location.reload();
        })
        .catch(err => {
            console.error("Błąd podczas logowania:", err);
            alert("Nie udało się zalogować. Sprawdź dane i spróbuj ponownie.");
        });
    }

    // Funkcja wylogowywania się użytkownika z aktualnej sesji

    function Wylogowywanie() {

        let text = "Czy na pewno chcesz się wylogować?"
            if(window.confirm(text) == true) {
                
                setCookies('user', null, { path: '/' });
                window.location.reload();
                
            } else {}
    }

    // Rejestracja nowego użytkownika

    async function rejestracja() {
        const recaptchaValue = recaptchaRef.current.getValue();
        const formularz = document.querySelector(".Rejestracja");
        const nazwa = document.getElementById("ResLogin").value;
        const email = document.getElementById("ResEmail").value;
        const haslo = document.getElementById("ResPassword").value;

        if (!recaptchaValue || !nazwa || !email || !haslo) {
            return window.alert("Uzupełnij wszystkie pola i zaznacz CAPTCHA."); // Walidacja, czy wszystkie pola są uzupełnione i dokonano weryfikacji Captcha
        }

        try {
            const res = await fetch("http://localhost:3001/rejestracja", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    login: nazwa,
                    mail: email,
                    haslo: haslo,
                    captchaToken: recaptchaValue
                })
            });

            if (!res.ok) throw new Error(`Błąd sieci: ${res.status}`);
            
            alert("Rejestracja zakończona sukcesem!");
            recaptchaRef.current.reset();
            window.location.reload(); 
        } catch (err) {
            console.error("Błąd rejestracji:", err);
            alert("Nie udało się zarejestrować konta. Spróbuj ponownie.");
            recaptchaRef.current.reset();
        }
    }

    // przewijanie do następnej strony listy filmów

    const NastepnaStrona = () => {
        if (Strona < totalPages) {
            setStrona(prevPage => prevPage + 1);
        }
    };

    // przewijanie do poprzedniej strony listy filmów

    const PoprzedniaStrona = () => {
        if (Strona > 1) {
            setStrona(prevPage => prevPage - 1);
        }
    };



        // FRONT END 

    return (
      <div className="App">
      
        <div className="pop-up hidden">
            <div className="pop-up-bg" onClick={ukryjRecenzje}></div>

                <div className="lista-recenzji" film-id="0">
                    <h2 className="header">{currentFilm.nazwa}</h2>

                    {currentFilm && (
                        <div className="SzczegolyFilmu" data-id={currentFilm.id_filmu}>
                            <img className="tloFilmu" src={currentFilm.tloFilmu} />
                            <p className='OpisFilmu'>{currentFilm.opis}</p>
                            <p><b>Data premiery:</b> {currentFilm.rok}</p>
                            <p><b>Gatunek:</b> {currentFilm.gatunki}</p>
                            <h3><b> Średnia ocen: </b>{currentFilm.srednia_ocen} / 5  <span className="gwiazdki">
                                        {"★".repeat(currentFilm.srednia_ocen)}{"☆".repeat(5 - currentFilm.srednia_ocen)}
                                    </span></h3>
                        </div>
                        )}

                        <h2 className="header">RECENZJE</h2>
                    
                        <StworzRecenzje />
                    
                <h3>Recenzje użytkowników: </h3>

                {recenzje.length === 0 ? (
                    <p className="NoRecenzje">Brak recenzji dla tego filmu. Bądź pierwszym!</p>
                    ) : (
                    recenzje.map((data) => {
                        return (
                            
                            <div className="recenzja" user-id={data.id} rec-id={data.recenzje_id}>

                                <span className='username'>{data.nazwa_uzytkownika} </span>
                                 <span className='ocena'>
                                    Ocena: {data.ocena} / 5 <span className="gwiazdki">
                                        {"★".repeat(data.ocena)}{"☆".repeat(5 - data.ocena)}
                                    </span>
                                </span>
                                <p className='trescRec'>{data.tresc}</p>

                                <StworzPrzycisk wlasciciel = {data.id} recenzja={data.recenzje_id} />

                            </div>
                            
                        )
                    })
                    )}

                </div>

        </div>

        <div className="pop-up-log hidden">
            <div className="pop-up-log-bg" onClick={ukryjLogowanie}></div>
                        <div className="Log-Menu">

                        <div className="LogForm">
                        <form className="Logowanie">
                            <h3>Zaloguj się</h3>
                            <p>E-mail: </p>
                            <input type='email' id="logEmail" name='mail'></input>
                            <p>Hasło: </p>
                            <input type='password' id="logPass" name='haslo'></input><br/>
                            <input type='button' value="Zaloguj się" onClick={logowanie}></input> 
                        </form>
                        </div>
                        <div className="RegForm">
                        <form className="Rejestracja" onSubmit={(e) => e.preventDefault()}>
                            <h3>Zarejestruj się</h3>
                            <p>Nazwa użytkownika: </p>
                            <input type='text' id="ResLogin" name='login'></input>
                            <p>E-mail: </p>
                            <input type='email' id="ResEmail" name='mail'></input>
                            <p>Hasło: </p>
                            <input type='password' id="ResPassword" name='haslo'></input><br/>

                            <center><ReCAPTCHA sitekey="6Lca9FYrAAAAABP64yFQyWFnrOh5NMtzGxEPQnA7" ref={recaptchaRef} id="Captcha" /></center>

                            <input type='button' value="Załóż Konto" onClick={rejestracja}></input>

                        </form>
                        </div>
                    </div>
            
        </div>

      <header className="App-header">
                <img src={`${process.env.PUBLIC_URL}/Logo192.png`} className="Logo" alt="Banner"/>
                <div className="Tytul">
                   <h1>FILMREV</h1>
                </div>
                    <LoginCheck/>
            </header>
            <div id="lista">
            {filmy.length < 0 ? (
                <p className='NoFilm'>Brak filmów do wyświetlenia.</p>
            ) : (
                filmy.map((data) => {
                    return (
                        <div className="film" data-id={data.id_filmu} onClick={() => setCurrentFilm(data)}>
                            <img className="plakat" src={data.plakat}></img>
                            <div className="Szczegoly" onClick={pokazRecenzje}>
                                <p className="tytul">{data.nazwa}</p>
                                <div className="info">
                                    <p className="rok">Data produkcji: {data.rok}</p>
                                    <p className="gatunek">Gatunek: {data.gatunki}</p>
                                </div>
                                <p className="srednia_re">Średnia Ocen: {data.srednia_ocen}/5 <span className="gwiazdki">
                                        {"★".repeat(data.srednia_ocen)}{"☆".repeat(5 - data.srednia_ocen)}
                                    </span></p>
                            </div>
                        </div>
                    )
                })
            )}
            </div>
        
        <div className="Strony">
            <button id="Poprzednia Strona" onClick={PoprzedniaStrona} disabled={Strona == 1}>
                🡄
            </button>
            <span> Strona {Strona} z {totalPages} </span>
            <button id="NastepnaStrona" onClick={NastepnaStrona} disabled={Strona >= totalPages || totalPages == 0}>
                🡆
            </button>
        </div>
            <footer className='Stopa'>
                <p>© 2025 FILMREV - Autor projektu: Maciej Motyka</p>
            </footer>
        </div>
  );
}

export default App;
