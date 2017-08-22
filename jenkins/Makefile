all :
	@echo 'use: make build|showpass|up|remove|bash|bash-debian|bash-fedora'
build :
	sudo docker-compose build
up :
	sudo docker-compose up -d
remove :
	sudo docker-compose down
showpass :
	sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
bash :
	sudo docker exec -it jenkins bash
bash-debian :
	sudo docker exec -it jsdebian bash
bash-fedora :
	sudo docker exec -it jsfedora bash
