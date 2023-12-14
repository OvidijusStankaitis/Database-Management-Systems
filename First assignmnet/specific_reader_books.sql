SELECT 
    Stud.Egzempliorius.nr, 
    pavadinimas
FROM 
    Stud.Skaitytojas
INNER JOIN 
    Stud.Egzempliorius ON Stud.Egzempliorius.skaitytojas = Stud.Skaitytojas.nr
INNER JOIN 
    Stud.Knyga ON Stud.Knyga.isbn = Stud.Egzempliorius.isbn
WHERE 
    vardas = 'Jonas' 
    AND pavarde = 'Petraitis' 
    AND paimta IS NOT NULL; 