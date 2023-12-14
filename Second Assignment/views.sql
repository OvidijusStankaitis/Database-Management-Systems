CREATE VIEW view_klientu_balansai AS
SELECT 
    k.kliento_id,
    k.vardas,
    k.pavarde,
    SUM(s.balansas) AS bendras_balansas
FROM 
    klientas k
JOIN 
    saskaita s ON k.kliento_id = s.kliento_id
GROUP BY 
    k.kliento_id, k.vardas, k.pavarde;
    
----------------------------------------------

CREATE MATERIALIZED VIEW mat_view_transakciju_santrauka AS
SELECT
    k.kliento_id,
    k.vardas,
    k.pavarde,
    COUNT(t.transakcijos_id) AS visos_transakcijos,
    SUM(t.suma) AS bendra_transakciju_suma
FROM
    klientas k
JOIN
    saskaita s ON k.kliento_id = s.kliento_id
JOIN
    transakcija t ON s.saskaitos_id = t.out_saskaitos_id OR s.saskaitos_id = t.in_saskaitos_id
GROUP BY
    k.kliento_id, k.vardas, k.pavarde;


-- To refresh
REFRESH MATERIALIZED VIEW mat_view_transakciju_santrauka;