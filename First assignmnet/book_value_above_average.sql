SELECT * FROM (

WITH BendraVerteKnygai AS (
    SELECT 
        Stud.Knyga.pavadinimas AS Knygos_pavadinimas,
        COUNT(Stud.Egzempliorius.nr) * COALESCE(Stud.Knyga.verte, 15) AS Visu_knygos_egzemplioriu_verte,
        AVG(COUNT(Stud.Egzempliorius.nr) * COALESCE(Stud.Knyga.verte, 15)) OVER() AS Vidutine_knygos_egzemplioriu_verte
    FROM 
        Stud.Knyga
        LEFT JOIN Stud.Egzempliorius ON Stud.Knyga.isbn = Stud.Egzempliorius.isbn
    GROUP BY 
        Stud.Knyga.isbn
)

SELECT 
    Knygos_pavadinimas,
    Visu_knygos_egzemplioriu_verte,
    ROUND(Vidutine_knygos_egzemplioriu_verte, 2) AS Vidutine_visu_knygos_egzemplioriu_verte,
    DENSE_RANK() OVER(ORDER BY Visu_knygos_egzemplioriu_verte DESC) AS rank
FROM 
    BendraVerteKnygai
WHERE 
    Visu_knygos_egzemplioriu_verte < Vidutine_knygos_egzemplioriu_verte
) AS x
WHERE rank <= 2;