-- Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
SELECT
    ville_nom,
    ville_population_2012,
    ville_departement,
    departement_nom
FROM
    villes,
    departement
WHERE
    ville_departement = departement_code
ORDER BY
    ville_population_2012 DESC
LIMIT
    10;

-------
-- Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, 
-- en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
SELECT
    departement_nom,
    departement_code,
    count(ville_departement)
FROM
    villes,
    departement
WHERE
    villes.ville_departement = departement_code
GROUP BY
    departement_nom
ORDER BY
    count(ville_departement) DESC;

--------------------------------------
--Obtenir la liste des 10 plus grands départements, en terme de superficie
SELECT
    departement_nom,
    sum(ville_surface)
FROM
    villes,
    departement
WHERE
    villes.ville_departement = departement.departement_code
GROUP BY
    departement_nom
ORDER BY
    sum(ville_surface) DESC
LIMIT
    10;

------------------
-- Obtenir la liste des villes qui ont un nom existants plusieurs fois, 
-- et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
SELECT
    ville_nom,
    count(ville_nom)
FROM
    villes
GROUP BY
    ville_nom
ORDER BY
    count(ville_nom) DESC
LIMIT
    10;

-- Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne
SELECT
    ville_nom,
    ville_surface
FROM
    villes
HAVING
    ville_surface > (
        select
            avg(ville_surface)
        from
            villes
    )
LIMIT
    10;

-- Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
SELECT
    departement_nom,
    sum(ville_population_2012)
FROM
    villes,
    departement
WHERE
    ville_departement = departement_code
GROUP BY
    departement_nom
HAVING
    sum(ville_population_2012)> 2000000
LIMIT
    10;

-- avec inner join
-- SELECT departement_nom, sum(ville_population_2012) AS somm_pop
-- from departement
-- inner join villes
-- ON departement_code = ville_departement
-- group by departement_nom
-- having somm_pop > 2000000;

-- Remplacez les tirets par un espace vide, 
-- pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)

UPDATE 
    villes
SET 
    ville_nom = REPLACE(ville_nom, 'SAINT-', 'SAINT ')
WHERE 
    ville_nom LIKE 'SAINT%';

SELECT
    ville_nom
FROM
    villes
WHERE 
    ville_nom LIKE 'SAINT%'
LIMIT 10;