help :
	@echo 'use: make ssh | remove | build | up | backup | restore'

ssh :
	-ssh -l user -p 2255 -X localhost

ssh-plain :
	-ssh -l user -p 2266 localhost

remove :
	docker-compose down

build :
	docker-compose build

up :
	docker-compose up -d

exec-plain :
	docker-compose exec plain sh

exec-terminal :
	docker-compose exec terminal bash

backup :
	docker-compose stop
	docker run --rm --volumes-from terminal -v `pwd`/tarballs:/backup fedora:latest tar czf /backup/user_home.tar.gz /home/user
	docker-compose up -d
	sha256sum tarballs/*.gz > tarballs/sha256sum.txt

restore :
	sha256sum --status -c tarballs/sha256sum.txt
	docker-compose stop
	docker run --rm --volumes-from terminal -v `pwd`/tarballs:/backup fedora:latest tar xzf /backup/user_home.tar.gz
	docker-compose up -d
