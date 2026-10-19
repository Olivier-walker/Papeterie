-- Step 1 : Articles
SELECT id_article, libelle, prix
FROM Articles
ORDER BY prix DESC;

-- Step 2 :  categories
SELECT
    c.id_categorie,
    c.nom_categorie,
    COUNT(a.id_article) AS nombre_articles
FROM CATEGORIE c
LEFT JOIN Articles a
    ON a.id_categorie = c.id_categorie
GROUP BY c.id_categorie, c.nom_categorie
ORDER BY c.id_categorie;

-- Reponse au piège : évite de répéter les noms et de créer des incohérences

