-- Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990';