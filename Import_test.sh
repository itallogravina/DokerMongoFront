#!/bin/bash
echo "*********Case statement************"
echo "1 - Criar App com dados"
echo "2 - Criar App sem dados"
echo "3 - excluir todos os dockers "
read num

case $num in
"1")
docker-compose up -d 

sleep 5s

docker cp ./src/dados.json easy_db:/
 
docker exec -it easy_db mongoimport --jsonArray --db easydb --collection product \
          --authenticationDatabase admin --username admin --password admin \
          --drop --file dados.json
;;
"2")
docker-compose up -d 
;;
"3")
docker stop easy_app easy_db easy_express

docker rm easy_app easy_db easy_express
;;
*)
echo "Não compativel"
;;
esac
