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

--Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`name`,`teachers`.`surname`,`departments`.`name`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'

--BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`name`,`students`.`surname`,`courses`.`name`, COUNT(`exam_student`.`vote`) AS `tries`,
MAX(`exam_student`.`vote`) AS `max_vote`
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `max_vote` >= 18