# Génération de graphiques pour un chauffage avec pompe à chaleur

Le code se compose en deux fonctions, une pour lire les données dans un fichier csv
ansi que compléter les mesures manquantes(j'ai fait la fonction avant le nouveau fichie envoyé par le prof).


L'autre fonction a pour de dessiner les graphes à une date donnée par l'utilisateur

# Pour l'utiliser
1. Lancer *Matlab*
pac_data = read_pac_data('PAC_data_2020-12-06_2020-12-13.csv');
plot_pac_data(pac_data, '2020-12-10');
~~~
