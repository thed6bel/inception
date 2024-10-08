# Projet Inception - École 42

## Description
Le projet Inception fait partie du cursus de l'École 42. Il consiste à mettre en place une mini-infrastructure de différents services en utilisant Docker et Docker Compose. L'objectif est de créer un environnement de développement virtuel composé de plusieurs conteneurs interconnectés.

## Objectifs
- Maîtriser l'utilisation de Docker et Docker Compose
- Comprendre les concepts de virtualisation et de conteneurisation
- Mettre en place une infrastructure web complète
- Configurer et interconnecter différents services

## Services implémentés
- NGINX avec TLSv1.2 ou TLSv1.3
- WordPress + php-fpm
- MariaDB
- Volumes pour la base de données WordPress et les fichiers du site
- Un réseau Docker dédié

## Compétences développées
- Administration système
- Gestion de conteneurs Docker
- Configuration de services web
- Sécurisation des communications (HTTPS)
- Orchestration de services avec Docker Compose

## Installation et utilisation
1. Clonez ce dépôt :
   ```
   git clone https://github.com/thed6bel/inception.git
   ```
2. Naviguez dans le dossier du projet :
   ```
   cd inception
   ```
3. Créez votre .env avec toutes vos données :

4. Démarrez les services avec le make file :
   ```
   make
   ```
5. Accédez à votre site WordPress via https://localhost:9000

## Structure du projet
```
inception/
├── srcs/
│   ├── requirements/
│   │   ├── nginx/
│   │   ├── wordpress/
│   │   └── mariadb/
│   └── .env
└── README.md
└── Makefile
```
