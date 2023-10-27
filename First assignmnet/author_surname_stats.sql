SELECT 
    Stud.Autorius.pavarde AS "Pavarde",
    COUNT(DISTINCT Stud.Autorius.vardas) AS "Autoriu skaicius",
    SUM(Stud.Knyga.puslapiai) AS "Puslapiu suma",
    SUM(Stud.Knyga.verte) AS "Knygu kaina",
    ROUND((SUM(Stud.Knyga.verte) / SUM(Stud.Knyga.puslapiai)), 3) AS "Puslapio kaina"
FROM 
    Stud.Autorius
JOIN 
    Stud.Knyga ON Stud.Autorius.isbn = Stud.Knyga.isbn
GROUP BY 
    Stud.Autorius.pavarde
HAVING 
    COUNT(DISTINCT Stud.Autorius.vardas) > 1;