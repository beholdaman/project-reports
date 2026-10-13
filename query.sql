
with RECURSIVE name_tree as (
   select id, description, fk_project
   from projects
   where id = 11 
   union all
   select projects.id,  projects.description, projects.fk_project
   from projects join name_tree
    on name_tree.fk_project = projects.id  
) 
SELECT * FROM name_tree WHERE id <> 11;

SELECT exp_hours, act_hours
FROM projects
WHERE id = 1;

SELECT * FROM projects;


SELECT id, number, description, exp_hours, act_hours + act_hours_tasks
 FROM projects;

SELECT reports.fk_user, users.name, users.surname, SUM(HOUR(SUBTIME(hour_end, hour_start)) + ( MINUTE(SUBTIME(hour_end, hour_start))/60 ))/22 
FROM reports JOIN projects 
ON reports.fk_project = projects.id 
    JOIN users ON reports.fk_user = users.id 
    WHERE MONTH(date) = '03' AND YEAR(date) = '2022' GROUP BY reports.fk_user;

WITH RECURSIVE gerarchia AS (
SELECT ID AS id_antenato, ID AS id_discendente
FROM projects
    UNION ALL
SELECT g.id_antenato, p.ID
FROM gerarchia g
JOIN projects p ON p.FK_PROJECT = g.id_discendente
)
SELECT p.ID, p.NUMBER, p.description,
    ROUND(
        COALESCE(SUM(TIME_TO_SEC(TIMEDIFF(r.HOUR_END, r.HOUR_START))) / 3600, 0) / 22,
        2) AS ore_medie_per_giorno_lavorativo
FROM projects p JOIN gerarchia g
         ON g.id_antenato = p.ID
LEFT JOIN reports r
        ON r.FK_PROJECT = g.id_discendente
AND MONTH(r.date) = '2022-03-01'
    GROUP BY p.ID, p.NUMBER
    ORDER BY p.ID

