-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM `students` 
RIGHT JOIN `degrees` 
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia'

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT * 
FROM `degrees` 
RIGHT JOIN `departments` 
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze'

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * 
FROM `courses` 
RIGHT JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id`
RIGHT JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`name` = 'Fulvio'
AND `teachers`.`surname` = 'Amato'

--Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `courses`.*,`degrees`.*,`teachers`.*
FROM `courses`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`