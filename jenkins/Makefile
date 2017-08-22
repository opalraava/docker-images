all :
	@echo 'use: make build|showpass|up|remove|bash|bash-debian|bash-fedora'
build :
	docker-compose build
up :
	docker-compose up -d
remove :
	docker-compose down
showpass :
	docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
bash :
	docker exec -it jenkins bash
bash-debian :
	docker exec -it jsdebian bash
bash-fedora :
	docker exec -it jsfedora bash
