
INSERT INTO Project_Assignments (project_id, pool_member_id) 
SELECT 1, pm.id
FROM Pool_Members pm
INNER JOIN Pool_Member_Skills pms ON pm.id = pms.pool_member_id
INNER JOIN Project_Skills ps ON pms.skill_id = ps.skill_id
WHERE ps.project_id = 1
GROUP BY pm.id;

SELECT p.title, CONCAT(pm.first_name, ' ', pm.last_name) AS Pool_Member_Name
FROM Projects p
LEFT JOIN Project_Assignments pa ON p.id = pa.project_id
LEFT JOIN Pool_Members pm ON pa.pool_member_id = pm.id;

SELECT s.name AS Skill, s.type AS Type, COUNT(pms.pool_member_id) AS Total_Members
FROM Skills s
LEFT JOIN Pool_Member_Skills pms ON s.id = pms.skill_id
GROUP BY s.name, s.type;

SELECT title, phase, FORMAT(budget, 2) AS Budget
FROM Projects
ORDER BY start_date;

SELECT pr.title AS Project_Title, pr.phase AS Project_Phase, cl.organisation_name AS Client, FORMAT(pr.budget, 2) AS Budget
FROM Projects pr
JOIN Clients cl ON pr.client_id = cl.id
ORDER BY pr.start_date;
