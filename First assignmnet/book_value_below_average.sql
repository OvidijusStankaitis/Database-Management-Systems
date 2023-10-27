WITH BendraVerteKnygai AS (
    SELECT 
        Stud.Knyga.isbn,
        COUNT(Stud.Egzempliorius.nr) * COALESCE(Stud.Knyga.verte, 15) AS BendraVerte
    FROM 
        Stud.Knyga
        LEFT JOIN Stud.Egzempliorius ON Stud.Knyga.isbn = Stud.Egzempliorius.isbn
    GROUP BY 
        Stud.Knyga.isbn
),
VidutineVerte AS (
    SELECT 
        AVG(BendraVerte) AS VidutineBendraVerte
    FROM 
        BendraVerteKnygai
)

SELECT
    DISTINCT(Stud.Knyga.pavadinimas) AS "Knygos pavadinimas",
    BendraVerteKnygai.BendraVerte AS "Visu konkrecios knygos egzemplioriu verte",
    ROUND(VidutineVerte.VidutineBendraVerte, 2) AS "Vidutine visu konkrecios knygos egzemplioriu verte"
FROM 
    Stud.Knyga
    JOIN BendraVerteKnygai ON Stud.Knyga.isbn = BendraVerteKnygai.isbn
    CROSS JOIN VidutineVerte
WHERE 
    BendraVerteKnygai.BendraVerte < VidutineVerte.VidutineBendraVerte;
