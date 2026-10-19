-- Étape 1 : Afficher les articles du plus cher au moins cher
SELECT id_article, libelle, prix
FROM Articles
ORDER BY prix DESC;
