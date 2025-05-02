# Utiliser Python 3.13 slim comme image de base
FROM python:3.13-slim

LABEL authors="mouhamadoumansour"

# Définir les variables d'environnement
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Définir le répertoire de travail
WORKDIR /Deploiement-App-Django-Kubernetes

# Copier le fichier requirements.txt et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le fichier des variables d'environnement
COPY .env .env

# Copier le reste du code de l'application
COPY . .

# Créer un utilisateur non-root pour exécuter l'application
RUN adduser --disabled-password --gecos "" appuser
RUN chown -R appuser:appuser /Deploiement-App-Django-Kubernetes
USER appuser

# Définir un volume pour les données persistantes
VOLUME ["/Deploiement-App-Django-Kubernetes/data"]

# Exposer le port 8000
EXPOSE 8000

# Commande pour démarrer l'app avec le serveur de développement Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]