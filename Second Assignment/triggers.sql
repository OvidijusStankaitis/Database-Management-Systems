CREATE OR REPLACE FUNCTION update_balance() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.out_saskaitos_id IS NOT NULL THEN
        UPDATE saskaita SET balansas = balansas - NEW.suma WHERE saskaitos_id = NEW.out_saskaitos_id;
    END IF;
    IF NEW.in_saskaitos_id IS NOT NULL THEN
        UPDATE saskaita SET balansas = balansas + NEW.suma WHERE saskaitos_id = NEW.in_saskaitos_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_balance
AFTER INSERT ON transakcija
FOR EACH ROW EXECUTE FUNCTION update_balance();

------------------------------------------

CREATE OR REPLACE FUNCTION set_account_closing_date() RETURNS TRIGGER AS $$
BEGIN
    IF OLD.statusas IS DISTINCT FROM NEW.statusas AND NEW.statusas = 'Neaktyvus' THEN
        UPDATE saskaita SET uzdarymo_data = CURRENT_DATE WHERE kliento_id = NEW.kliento_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_set_account_closing_date
AFTER UPDATE OF statusas ON klientas
FOR EACH ROW EXECUTE FUNCTION set_account_closing_date();