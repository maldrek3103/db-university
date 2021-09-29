-- Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990';

-- Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`, `cfu`
FROM `courses`
WHERE `cfu` > '10'

-- Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`,`surname`, `date_of_birth`
FROM `students`
WHERE DATE_SUB(CURDATE(),INTERVAL 30 YEAR) > `date_of_birth`