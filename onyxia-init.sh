#!/bin/sh

# Les deux librairies sont déjà installées dans le conteneur, ce n'est donné qu'à titre d'exemple
# Si vous avez besoin d'installer des librairies supplémentaires, vous pouvez le faire ici
pip install --no-cache-dir -r requirements.txt

mkdir -p data results

# Copier le jeu de données dans le conteneur
mc cp s3/pacordonnier/yellow_tripdata_2024-05.parquet data/yellow-taxi.parquet

# Si vous avez besoin de faire d'autres initialisations, vous pouvez le faire ici