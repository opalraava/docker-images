all :
	@echo 'use: make up|remove|bash|showpass'
up :
	docker-compose up -d
remove :
	docker-compose down
showpass :
	docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
bash :
	docker exec -it jenkins bash
