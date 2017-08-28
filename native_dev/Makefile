help :
	@echo 'use: make ssh | clean | all | up | backup | restore'
	@echo '     make build|showpass|remove'
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
	docker-compose stop
	docker run --rm --volumes-from gitserver -v `pwd`/tarballs:/backup fedora:latest tar czf /backup/gitserver.tar.gz /home/git
	docker run --rm --volumes-from shell     -v `pwd`/tarballs:/backup fedora:latest tar czf /backup/shell.tar.gz /home/user
	docker run --rm --volumes-from jenkins   -v `pwd`/tarballs:/backup fedora:latest tar czf /backup/jenkins.tar.gz /var/jenkins_home
	docker run --rm --volumes-from redmine   -v `pwd`/tarballs:/backup fedora:latest tar czf /backup/redmine.tar.gz /usr/src/redmine/files
	docker run --rm --volumes-from mariadb   -v `pwd`/tarballs:/backup fedora:latest tar czf /backup/mariadb.tar.gz /var/lib/mysql
	docker-compose up -d
	sha256sum tarballs/*.gz > tarballs/sha256sum.txt

restore :
	sha256sum --status -c tarballs/sha256sum.txt
	docker-compose stop
	docker run --rm --volumes-from gitserver -v `pwd`/tarballs:/backup fedora:latest tar xzf /backup/gitserver.tar.gz
	docker run --rm --volumes-from shell     -v `pwd`/tarballs:/backup fedora:latest tar xzf /backup/shell.tar.gz
	docker run --rm --volumes-from jenkins   -v `pwd`/tarballs:/backup fedora:latest tar xzf /backup/jenkins.tar.gz
	docker run --rm --volumes-from redmine   -v `pwd`/tarballs:/backup fedora:latest tar xzf /backup/redmine.tar.gz
	docker run --rm --volumes-from mariadb   -v `pwd`/tarballs:/backup fedora:latest tar xzf /backup/mariadb.tar.gz
	docker-compose up -d
