#!/bin/bash

# 1. Définition des variables (adaptez le chemin S3 si nécessaire)
BUCKET_DEST="s3/pacordonnier/results_demo_$(date +%Y%m%d)"
LOCAL_DIR="./results"

echo "📤 Début de l'exportation des résultats vers S3..."

# 2. Vérification si le dossier local existe et n'est pas vide
if [ -d "$LOCAL_DIR" ] && [ "$(ls -A $LOCAL_DIR)" ]; then
    
    # 3. Utilisation de l'outil 'mc' (MinIO Client) pré-installé sur Onyxia
    # On utilise 'mirror' pour synchroniser le dossier
    mc mirror "$LOCAL_DIR" "$BUCKET_DEST"
    
    if [ $? -eq 0 ]; then
        echo "✅ Succès ! Vos fichiers ont été sauvegardés dans : $BUCKET_DEST"
        echo "Contenu exporté :"
        mc ls "$BUCKET_DEST"
    else
        echo "❌ Erreur lors de l'exportation vers S3."
    fi
else
    echo "⚠️ Le dossier $LOCAL_DIR est vide ou inexistant. Rien à exporter."
fi