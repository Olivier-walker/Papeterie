
CREATE TABLE Articles (
    id_article INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    libelle VARCHAR(150) NOT NULL,
    prix INTEGER NOT NULL
);

INSERT INTO Articles (libelle, prix) VALUES
    ('Cahier 100 pages', 1200),
    ('Cahier 200 pages', 2000),
    ('Stylo à bille bleu', 500),
    ('Crayon à papier', 300),
    ('Règle 30 cm', 800),
    ('Manuel Mathématiques CM2', 15000),
    ('Cartable', 35000);
