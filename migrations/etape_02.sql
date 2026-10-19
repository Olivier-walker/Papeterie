-- Étape 2 : Les catégories

CREATE TABLE CATEGORIE (
    id_categorie INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categorie VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO CATEGORIE (nom_categorie) VALUES
    ('Cahiers'),
    ('Écriture'),
    ('Géométrie'),
    ('Manuels scolaires'),
    ('Bagagerie');

-- Ajouter la colonne à la table existante
ALTER TABLE Articles
ADD COLUMN id_categorie INTEGER;

-- Ajouter la clé étrangère
ALTER TABLE Articles
ADD CONSTRAINT fk_articles_categorie
FOREIGN KEY (id_categorie)
REFERENCES CATEGORIE(id_categorie);

-- Associer les articles aux catégories
UPDATE Articles
SET id_categorie = (
    SELECT id_categorie
    FROM CATEGORIE
    WHERE nom_categorie = 'Cahiers'
)
WHERE libelle IN ('Cahier 100 pages', 'Cahier 200 pages');

UPDATE Articles
SET id_categorie = (
    SELECT id_categorie
    FROM CATEGORIE
    WHERE nom_categorie = 'Écriture'
)
WHERE libelle IN ('Stylo à bille bleu', 'Crayon à papier');

UPDATE Articles
SET id_categorie = (
    SELECT id_categorie
    FROM CATEGORIE
    WHERE nom_categorie = 'Géométrie'
)
WHERE libelle = 'Règle 30 cm';

UPDATE Articles
SET id_categorie = (
    SELECT id_categorie
    FROM CATEGORIE
    WHERE nom_categorie = 'Manuels scolaires'
)
WHERE libelle = 'Manuel Mathématiques CM2';

UPDATE Articles
SET id_categorie = (
    SELECT id_categorie
    FROM CATEGORIE
    WHERE nom_categorie = 'Bagagerie'
)
WHERE libelle = 'Cartable';

-- Rendre la catégorie obligatoire
ALTER TABLE Articles
ALTER COLUMN id_categorie SET NOT NULL;