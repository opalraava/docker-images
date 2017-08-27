help :
	@echo 'use: make ssh | clean | all | up | backup'
	@echo '     make build|showpass|up|remove|backup|bugout'
	@echo '     make bash-(jenkins|debian|fedora|shell|redmine|db|gitweb|phpmyadmin)'

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
bash-phpmyadmin :
	docker exec -it phpmyadmin /bin/sh
bash-gitweb :
	docker exec -it gitweb /bin/sh

backup :
	docker run --rm --volumes-from gitserver -v `pwd`/backup-cluster:/backup fedora:latest tar cvzf /backup/gitserver.tar.gz /home/git
	docker run --rm --volumes-from shell -v `pwd`/backup-cluster:/backup fedora:latest     tar cvzf /backup/shell.tar.gz /home/user
	docker run --rm --volumes-from jenkins -v `pwd`/backup-cluster:/backup fedora:latest   tar cvzf /backup/jenkins.tar.gz /var/jenkins_home
	docker run --rm --volumes-from redmine -v `pwd`/backup-cluster:/backup fedora:latest   tar cvzf /backup/redmine.tar.gz /usr/src/redmine/files
	docker run --rm --volumes-from mariadb -v `pwd`/backup-cluster:/backup fedora:latest   tar cvzf /backup/mariadb.tar.gz /var/lib/mysql
	sha256sum backup-cluster/*.gz > backup-cluster/sha256sum.txt

checksum :
	sha256sum -c backup-cluster/sha256sum.txt
