# FilmRev - System Recenzji Filmowych

Aplikacja webowa umożliwiająca przeglądanie bazy filmów, rejestrację użytkowników oraz system dodawania, edycji i usuwania recenzji.

## Funkcjonalności

1. **System Uwierzytelniania i Autoryzacji** - Rejestracja nowych użytkowników i logowanie z wykorzystaniem tokenów JWT i hashowania haseł, zabezpieczone mechanizmem Google reCAPTCHA.
2. **Integracja z TMDB** - Automatyczny import bazy filmów oraz gatunków z The Movie Database przy starcie serwera, wyświetlanie listy filmów i ich szczegółów (gatunek, data premiery, średnia recenzji).
3. **Zarządzanie Recenzjami** - Zalogowany użytkownik może dodać recenzję i ocenę od 1 do 5 gwiazdek do wybranego filmu, edytować treść i ocenę , oraz trwale usunąć swoją recenzję.

    **Wykorzystane technologie:**
    * React.js
    * Node.js
    * MySQL
    * Zewnętrzne API - The Movie Database (TMDB) i Google reCAPTCHA
## Instrukcja uruchomienia
### Wymagania:
* Docker oraz Docker Compose (lub Docker Desktop).
### Uruchomienie:
1. Otwórz główny folder projektu za pomocą terminala.
2. Uruchom aplikację poleceniem:

    ```bash
    docker compose up
    ```
3. Po uruchomieniu aplikacja będzie działać pod tym adresem: **http://localhost:3000**.

## Autorzy projektu
* **Maciej Motyka** (Nr indeksu: 51269)

