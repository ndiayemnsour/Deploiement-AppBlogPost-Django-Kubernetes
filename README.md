# Deploiement App BlogPost  Django-kubernetes

Une application web de publication développée avec Django, conteneurisée avec Docker et déployée sur un cluster Kubernetes.

## Fonctionnalités
- Ajouter article
- Lister article 
- Modifier article
- Supprimer article
- Mise a jour article
- filtrer article par auteur
- filtrer article par date ajout
- filtrer article par category
- filtrer article par staut (brouilllon, publié)
- Ajouter category 
- lister category
- Modifier category
- Supprimer category
- Mise a jour category

## 📁 Structure du projet
├── Deploiement-App-Django-kubernetes/ 
    ├── manage.py 
    ├── requirements.txt 
    ├──.gitignore 
    ├──README.md 
    ├── Dockerfile 
    ├── kubernetes/ 
        │ 
        ├── deployment.yaml 
        ├── configmap.yaml 
        ├── service.yaml 
        ├── hpa.yaml 
        ├── pvc.yaml 
        │ 
        └── ingress.yaml

## Installation

```bash
git clone https://github.com/ndiayemnsour/Deploiement-AppBlogPost-Django-Kubernetes.git
cd Deploiement-App-Django-kubernetes
python -m venv .venv
source .venv/bin/activate  # ou .venv\Scripts\activate sur Windows
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```
##Dockerisation
##Construire l’image
```bash
docker build -t mon-utilisateur/Deploiement-App-Django-kubernetes 
docker run -p 8000:8000 mon-utilisateur/Deploiement-App-Django-kubernetes
```
##Déploiement sur Kubernetes
##Appliquer les fichiers YAML :
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```
##Vérifier les ressources
```bash
kubectl get pods
kubectl get services
kubectl get ingress
```


