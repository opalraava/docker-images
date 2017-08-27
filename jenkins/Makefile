help :
	@echo 'use: make ssh | clean | all | up'
	@echo '     make build|showpass|up|remove|backup|bugout'
	@echo '     make bash-(jenkins|debian|fedora|shell|redmine|db)'

all : build
clean : remove

ssh :
	ssh -l user -p 2233 -X localhost

build :
	docker-compose build
up :
	docker-compose up -d
remove :
	docker-compose down
showpass :
	docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword


bash-jenkins :
	docker exec -it jenkins bash
bash-debian :
	docker exec -it jsdebian bash
bash-fedora :
	docker exec -it jsfedora bash
bash-shell :
	docker exec -it shell bash
bash-redmine :
	docker exec -it redmine bash
bash-db :
	docker exec -it db bash

bugout : backup

backup : remove
	rm -f backup.tar backup.tar.gz
	tar cvf backup.tar *
	gzip -v9 backup.tar
