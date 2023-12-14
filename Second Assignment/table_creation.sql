CREATE TABLE klientas (
    kliento_id BIGSERIAL PRIMARY KEY,
    vardas VARCHAR(255) NOT NULL,
    pavarde VARCHAR(255) NOT NULL,
    miestas VARCHAR(255) NOT NULL,
    gatve VARCHAR(255) NOT NULL,
    namas VARCHAR(20) NOT NULL,
    telefonas VARCHAR(20) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    slaptazodis CHAR(64) NOT NULL,
    statusas VARCHAR(50) DEFAULT 'Aktyvus' CHECK (statusas IN ('Aktyvus', 'Neaktyvus', 'Suspenduotas'))
);

CREATE TABLE darbuotojas (
    darbuotojo_id BIGSERIAL PRIMARY KEY,
    vardas VARCHAR(255) NOT NULL,
    pavarde VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    slaptazodis CHAR(64) NOT NULL,
    departamentas VARCHAR(255) NOT NULL,
    pareigos VARCHAR(255) NOT NULL
);

CREATE TABLE saskaita (
    saskaitos_id BIGSERIAL PRIMARY KEY,
    kliento_id BIGINT REFERENCES klientas(kliento_id),
    darbuotojo_id BIGINT REFERENCES darbuotojas(darbuotojo_id),
    tipas VARCHAR(50) NOT NULL DEFAULT 'Einamoji' CHECK (tipas IN ('Einamoji', 'Taupomoji', 'Indėlio')),
    balansas NUMERIC NOT NULL,
    atidarymo_data DATE NOT NULL,
    uzdarymo_data DATE
);

CREATE TABLE transakcija (
    transakcijos_id BIGSERIAL PRIMARY KEY,
    out_saskaitos_id BIGINT REFERENCES saskaita(saskaitos_id),
    in_saskaitos_id BIGINT REFERENCES saskaita(saskaitos_id),
    suma NUMERIC NOT NULL,
    data DATE NOT NULL,
    paskirtis TEXT NOT NULL,
    statusas VARCHAR(50) NOT NULL CHECK (statusas IN ('Įvykdytas', 'Sulaikytas', 'Nepavykęs'))
);