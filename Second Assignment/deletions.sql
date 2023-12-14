DROP TABLE IF EXISTS transakcija;
DROP TABLE IF EXISTS saskaita;
DROP TABLE IF EXISTS klientas;
DROP TABLE IF EXISTS darbuotojas;

DROP VIEW IF EXISTS view_klientu_balansai;
DROP MATERIALIZED VIEW IF EXISTS mat_view_transakciju_santrauka;

DROP TRIGGER IF EXISTS trigger_update_balance ON transakcija;
DROP FUNCTION IF EXISTS update_balance();

DROP TRIGGER IF EXISTS trigger_set_account_closing_date ON klientas;
DROP FUNCTION IF EXISTS set_account_closing_date();

DROP INDEX IF EXISTS idx_transakcija;
DROP INDEX IF EXISTS idx_unique_klientas_vardas_pavarde;
