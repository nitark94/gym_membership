# gym_membership
Tämä tietokanta on suunniteltu  kuntosalin jäsenyyshallintaa varten.

Tietokanta koostuu neljästä päätaulusta:
1. membership_types - Määritellään eri jäsenyyksien tyypit, jotka voivat olla joko standard, premium tai gold. Taulusta löytyy sarakkeet:
    - id: Jäsenyyden yksilöivä tunnus
    - type_name: Jäsenyyden tyypin nimi
    - type_description: Kuvaus jäsenyyden eduista
    - monthly_fee: Kuukausimaksu kyseiselle jäsenyydelle
2. gym_members - Taulussa säilytetään jäsenien tiedot. Sarakkeet:
    - id: Jäsenen yksilöivä tunnus
    - first_name: Jäsenen etunimi
    - last_name: Jäsenen sukunimi
    - email: Jäsenen sähköpostiosoite
    - phone_number: Jäsenen puhelinnumero
    - date_of_birth: Jäsenen syntymäaika
    - membership_start_date: Jäsenyyden aloituspäivänmäärä
    - membership_end_date: Jäsenyyden loppumispäivänmäärä (jos jäsenyys päättymässä tai päättynyt)
    - membership_type_id: Viite membership_types-tauluun, joka kertoo minkä tyyppinen jäsenyys jäsenellä on
    - membership_status: Jäsenyyden tila
3. gym_classes - Taulussa on tietoa kuntosalitunneista. Sarakkeet:
    - id: Tunnin yksilöivä tunnus
    - class_name: Tunnin nimi
    - instructor: Tunnin vetäjä
    - schedule: Tunnin aikataulu (pvm ja kellonaika)
    - duration: Tunnin pituus minuutteina
    - capacity: Tunnin maksimikapasiteetti
4. class_registrations - Taulussa on tiedot jäsenten ilmoittautumisista tunneille. Sarakkeet:
    - id: Ilmoittautumisen yksilöivä tunnus
    - member_id: Viite gym_members-tauluun, joka kertoo kuka jäsen on ilmoittautunut
    - class_id: Viime gym_classes-tauluun, joka kertoo mille tunnille jäsen on ilmoittautunut
    - registration_date: Ilmoittautumispäivänmäärä

Asennus ja käyttöohjeet:
1. Tietokannan luominen:
    - Suorita SQL-komennot, jotka luovat taulut ja lisäävät esimerkkidatan
    - Käytä haluamaasi SQL-palvelinta, kuten MySQL, PostgreSQL tai SQLite
2. Tietokannan käyttö:
    - Voit käyttää SQL-kyselyitä jäsenten hallintaan, kuten lisäämiseen, muokkaamiseen, poistamiseen tai hakemiseen
    - Voit myös tarkastella ja hallita kuntosalitunteja ja ilmoittautumisia

    ESIM. Hae kaikki jäsenet, jotka ovat ilmoittautuneet Hot Yoga-tunnille:
    
    SELECT gm.first_name, gm.last_name, gc.class_name 
    FROM gym_members gm
    JOIN class_registrations cr ON gm.id = cr.member_id
    JOIN gym_classes gc ON cr.class_id = gc.id
    WHERE gc.class_name = 'Hot Yoga';

    tai ESIM2. Hae jäsenten tiedot ja heidän jäsenyyden tyypit:

    SELECT gm.first_name, gm.last_name, mt.type_name 
    FROM gym_members gm
    JOIN membership_types mt ON gm.membership_type_id = mt.id
    WHERE gm.id = 1;

