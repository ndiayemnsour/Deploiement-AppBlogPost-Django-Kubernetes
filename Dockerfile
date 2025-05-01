FROM ubuntu:latest
LABEL authors="mouhamadoumansour"

ENTRYPOINT ["top", "-b"]
FROM python:3.13-slim
#Definir les variables d'environnement
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
#Definir les dependances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
#Copy tout le code de L'app
Copy . .

#Créer un utilisateur non-root pour executer l'application
RUN adduser --disabled-password --gecos "" appuser
RUN chown -R appuser:appuser /app
USER appuser

#Volume pour les donnees persistantes
VOLUME ["/app/data"]

#Expose le port 8000
EXPOSE 8000

#Command pour demarrer l'app
CMD ["gunicorn", "--bin", "0.0.0.0:8000", "Deploiement_App_Django_Kubernetes.wsgi"]