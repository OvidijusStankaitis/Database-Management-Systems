CREATE INDEX idx_transakcija ON transakcija (out_saskaitos_id, in_saskaitos_id);
CREATE UNIQUE INDEX idx_unique_klientas_vardas_pavarde_email ON klientas (vardas, pavarde, email);
