# Welcome to the sample project built by Andrew Chuba!

## How to Run

### Local Dev
- Run setup-ubuntu.sh if you are on an ubuntu machine
Otherwise
- Go to **[this section](#Local-Machine-Environment-setup-instructions)**
- Run `docker-compose build`
- Run `docker-compose up`

### Production
- Run `./build_and_upload_prod_images.sh`

## Project Overview

### Goal of this project: 
To create a local development environment that has the following containerized services interacting with each other:
- static webpage that call the api
- back end api written with flask api
- postgresql database

### The technologies chosen for this project were:
- nginx - for its ability to act as a reverse proxy and host static web content
- flask api - because I was told to, but I like it as well
- Docker - for the containers
- Gunicorn - It's a popular, simple WSGI service to productionize a flask api application
- Ubuntu & MacOS - Both are good development environments, I used both.
- Docker-Compose - Makes setting up the development environment, and deploying containers to prouction super easy, organized, and highly configurable.
- Bash Scrpting - To automate local tasks
- Python - A great scripting language, used for creating db tables, as well as for the flask api
- Postgresql DB - The database specified for this project

## How it works

### Local Dev
The frontend:
- Static Webpages are hosted locally on port 8080
- The webpage contains a button and a field, press the button and the field will be populated with content from the API

The backend:
- Flask API code written in Python that handles requests to address "/api"
- GUnicorn to handle and forward requests to the flask api code
- Establish a connection with the database
The Database
- Can create sample tables in it once spun up from docker-compose using the `create_sample_tables.sh` in the root of this project

### Production and QA
The best way for this application to be productionized was to simply have the ability to 
- build production ready images that have resources with pseudo-hostnames
- Upload those impages to an image repository like DockerHub or ECR (specified within the docker-compose-prod.yml file)
Once those images are in DockerHub or ECR then they can be used within other resources that are more production ready like ECS and EKS and be spun up using infrastructure automation tools like Asible or Chef.

## Local Machine Environment setup instructions:

### Ubuntu Users
Use the setup script provided: setup-ubuntu.sh
This script will:
- Install everything needed for your local development
- Start the docker-compose script which will spin up the local infrastucture

### Mac Users
There is no script (yet) for this however you can:
- Install docker desktop https://www.docker.com/products/docker-desktop
- Install the latest Python https://www.python.org/downloads/ or brew
- Install Git through brew

### Windows Users
- Install docker desktop https://www.docker.com/products/docker-desktop
- Install the latest Python https://www.python.org/downloads/ 
- Install Git https://git-scm.com/download/win

## Future considerations 

### How this project can be more 'productionized'
CICD Workflows that will do the following on a code commit into master:
- Code Checks (Quality, Security)
- Build and Push Docker Image from Docker Compose
- Ansible Playbook (for example) would spin up infra in a test and/or qa cloud account
- Perform Performance/ ATDD Tests on that infra
- Deploy into Production
- Health Checks and Monitoring

