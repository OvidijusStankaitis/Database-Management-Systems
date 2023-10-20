SELECT 
    Stud.Autorius.pavarde AS "Pavarde",
    COUNT(DISTINCT Stud.Autorius.vardas) AS "Autoriu su tokia pat pavarde skaicius",
    SUM(Stud.Knyga.puslapiai) AS "Knygos puslapiu suma pavardei"
FROM 
    Stud.Autorius
JOIN 
    Stud.Knyga ON Stud.Autorius.isbn = Stud.Knyga.isbn
GROUP BY 
    Stud.Autorius.pavarde;
