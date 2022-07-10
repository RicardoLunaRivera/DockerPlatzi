#listar los contenedores que se corrieron
$docker ps -a

#muestra dados del contenedor
$docker inspect IDcontendor/nombreContenedor

#crear primer contenedor
$docker run --name nombreContenedor helloworld

#Eliminar contenedor
$docker rm nombreContenedor/IDcontendor

#Eliminar contenedores que no se utilizan/ya se corrieron
$docker container prune

#Entrar a la temrinal de un contenedor
$docker run -it nombreContenedor/IDcontendor

#-d sirve para mandar el proceso de un contenedor a background
#-p liga el puerto del contenedor al puerto del equipo host
$docker run --name nombreContenedor -d -p 8080:80 nginx

#Visualizar los logs del contenedor
$docker logs --tailf 10 -f proxi

#Revisar los volumenes que tenemos
$docker volume listar

#Montar un volumen a un contenedor
$docker run -d --name bd --mount src=dbdata,dst=data/bd

#Listar las imagenes descargadas
$doker image ls 

#Página para revisar imagenes disponibles para descargar
hub.docker.com

#Traer una imagen de un repositorio
$docker pull ubuntu:20.04

#Crear una imagen personalizada
$docker build -t ubuntu:platzi

#Retaguear para haer push a docker hub
$docker tag ubuntu:platzi nombre/ubuntu:platzi

#Login docker hub
$docker login 

#Subir una imagen a docker hub
$docker push nombre/ubuntu:platzi

#Para ver cómo esta construida la imagen
$docker history ubuntu:platzi


#DIVE es una herramienta para ver cómo esta construida la imagen de docker
https://github.com/wagoodman/dive

#Detener una imagen que esta corriendo
$docker stop nombreContenedor/IDcontendor

#Deployar una imagen con un dockerfile
docker build -t platziapp .

#Eliminar una imagen cuando se detenga
$docker run --rm

#Ejemplo de pone run puerto expuesto, eliminar cuando se detenga la imagen 
$docker run -d --rm -p 3000:3000 platziapp

#Ver las redes en docker
$docker network ls

#crear una red, el comando --attachable permite que otros contenedores se conecten por esa red
$docker network create --attachable "nombre"

#Conectar un contenedor a una red
$docker network connect "nombre de la red" "nombre del contenedor"

#ver qué contenedores estan conectados a la red
$docker network inspect "nombre de la red"

#Ejerccio crear una maquina con difrentes parametros
    # -d -> corre el procesdo del constenedor en background
    #--rm -> elimina el contenedor cuando este se detenga
    # --name -> le asigna un nombre al contenedor que se creara
    #-p -> setea el puerto del contenedor con el puerto del Host
    # --env -> envía parametros, en este caso el valir de la variable MONGO_URL
$docker run -d --rm --name app -p 3000:3000 --env MONGO_URL=mongodb://db:27017/test platziapp


#Eliminacion fozada de un contenedor
$docker rm -f "nombre del contenedor"

#Crear un contenerod atraves de Docker compose
$docker-compose up

#Crear contenedor con docker compose y dejarlo en back ground
$docker-compose up -d

#Ver losgs con docker compose
    #-f hace que este atento a los logs
$docker-compose logs -f "nombre del contenedor" "nombre de otro contenedor"..

#Entrar con bash al contenedor
$docker-compose exec "nombre del contenedor" bash

#eliminar contenedores con compose
$docker-compose down


#Crear mś de un contenedor app
    #nota los puertos se deben configurar en docker.compose.yml
$docker-compose up -d -scale app=2

#Forzar borrado de todos los contenedores prendidos o apagados
#, recorriendo todos lis ids de contenedores
$docker rm -f $(docker ps -aq)

#Eliminar networks, imagenes
$docker system prune

#asignarle una capacdad máxima de memoria a un contenedor
    #el tag -memory seguido de la cantidad de memoria
$docker run -d --name app --memory 1g platziapp

#Revisar qué recursos  está consumiendo los contenedores
$docker stats

#matar un contenedor
$docker kill "nombre del contenedor"


#dockerignore-> funciona para poner los arquivos que no se deben enviar a un Build de imagen dedocker

