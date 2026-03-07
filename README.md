# Deploiement d'une appication BlogPost Django avec kubernetes 

Une application web de publication développée avec Django, conteneurisée avec Docker et déployée sur un cluster Kubernetes.

## Présentation du projet

Ce projet consiste à concevoir, conteneuriser et déployer une application web de gestion d’articles développée avec Django, en utilisant Docker pour la conteneurisation et Kubernetes pour l’orchestration et la gestion du déploiement.

L’objectif principal est de démontrer comment une application web peut être déployée dans une architecture moderne basée sur des conteneurs afin de faciliter la portabilité, la scalabilité et la gestion automatisée de l’infrastructure.

L’application permet la gestion complète des articles d’un blog ainsi que des catégories associées, avec des fonctionnalités de création, modification, suppression et filtrage.

## Architecture technique

Le projet repose sur les technologies suivantes :

Django : Framework backend utilisé pour développer l'application web.

Docker : Permet de conteneuriser l'application afin de garantir la portabilité et la cohérence de l'environnement d'exécution.

Kubernetes : Plateforme d’orchestration utilisée pour automatiser le déploiement, la gestion et la mise à l’échelle de l’application.

Minikube : Utilisé pour exécuter un cluster Kubernetes en environnement local pour les tests et le développement.

## Technologies utilisées

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)
![Django](https://img.shields.io/badge/Django-Framework-green?logo=django)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-blue?logo=kubernetes)
![Minikube](https://img.shields.io/badge/Minikube-Local%20Cluster-orange?logo=kubernetes)
![Git](https://img.shields.io/badge/Git-Version%20Control-red?logo=git)
![Linux](https://img.shields.io/badge/Linux-Environment-yellow?logo=linux)

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
```bash
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
    ├── blogpost/ 
        ├── migrations/
        ├── admin.py 
        ├── models.py 
        ├── tests.py 
        ├── views.py
        ├── apps.py
        ├── __init__.py
        └── ingress.yaml
```
## Installation sur votre ordinateur

```bash
git clone https://github.com/ndiayemnsour/Deploiement-AppBlogPost-Django-Kubernetes.git
cd Deploiement-App-Django-kubernetes
python -m venv .venv
source .venv/bin/activate  # ou .venv\Scripts\activate sur Windows
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

## Dockerisation
L’application est encapsulée dans un conteneur Docker afin de garantir que toutes les dépendances nécessaires à son fonctionnement soient incluses dans l’image.
### Construire l’image Docker

```bash
docker docker build -t blogpost-app:latest .
```
### Exécution du conteneur :

```bash
docker docker run -p 8000:8000 blogpost-app:latest
```
## Déploiement sur Kubernetes
Le déploiement de l’application est géré par Kubernetes à l’aide de plusieurs ressources :
### Deployment
Permet de déployer et de gérer les pods contenant l’application Django.

### Service
Expose l’application afin de permettre l’accès aux pods depuis l’extérieur du cluster.

### Ingress
Permet de gérer l’accès HTTP à l’application à travers des règles de routage.

### ConfigMap et Secret

Utilisés pour externaliser les configurations et les données sensibles.

### Volumes (PV et PVC)
Persistent Volume (PV) : espace de stockage persistant dans le cluster.
Persistent Volume Claim (PVC) : demande de stockage utilisée par l’application.

### Autoscaling (HPA)
Le Horizontal Pod Autoscaler permet d’ajuster automatiquement le nombre de pods en fonction de la charge du système.

### Sauvegarde automatisée
Un mécanisme de backup automatique via CronJob Kubernetes peut être utilisé pour effectuer des sauvegardes périodiques des données
### Appliquer les fichiers YAML :
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```
### Vérifier les ressources
```bash
kubectl get pods
kubectl get services
kubectl get ingress
```

## Objectifs pédagogiques du projet
Ce projet permet de mettre en pratique plusieurs concepts importants du DevOps :
- Conteneurisation d’une application web
- Gestion des images Docker
- Déploiement d’une application dans Kubernetes
- Configuration des services et des volumes persistants
- Mise en place de l’autoscaling
- Automatisation de certaines tâches d’infrastructure


