SELECT A.id AS id, 
       CASE 
           WHEN A.p_id IS NULL THEN 'Root' 
           WHEN A.id NOT IN (SELECT p_id FROM tree WHERE p_id IS NOT NULL) THEN 'Leaf' 
           WHEN A.id IN (SELECT p_id FROM tree) AND p_id IS NOT NULL THEN 'Inner' 
       END AS Type
FROM tree AS A
ORDER BY A.id;
