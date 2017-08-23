help :
	@echo 'use: make build|showpass|up|remove|backup|bugout'
	@echo '     make bash-jenkins|bash-debian|bash-fedora|bash-shell'

all : build
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

bugout : backup
backup : remove
	rm -f backup.tar backup.tar.gz
	tar cvf backup.tar *
	gzip -v9 backup.tar
