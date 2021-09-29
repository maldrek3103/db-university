-- Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990'

-- Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`, `cfu`
FROM `courses`
WHERE `cfu` > '10'

-- Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`,`surname`, `date_of_birth`
FROM `students`
WHERE DATE_SUB(CURDATE(),INTERVAL 30 YEAR) > `date_of_birth`

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name`, `period`, `year`
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * 
FROM `exams`
WHERE `date` = '2020-06-20'
AND `hour` > '14:00:00'