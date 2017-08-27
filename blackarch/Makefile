help :
	@echo 'use: make ssh | remove | build | up | backup | restore'

ssh :
	ssh -l user -p 2244 -X localhost

remove :
	docker-compose down

build :
	docker-compose build

up :
	docker-compose up -d

bash :
	docker exec -it blackarch bash

backup :
	docker-compose stop
	docker run --rm --volumes-from blackarch -v `pwd`/backup-cluster:/backup fedora:latest tar czf /backup/user_home.tar.gz /home/user
	docker-compose up -d
	sha256sum backup-cluster/*.gz > backup-cluster/sha256sum.txt

restore :
	sha256sum --status -c backup-cluster/sha256sum.txt
	docker-compose stop
	docker run --rm --volumes-from gitserver -v `pwd`/backup-cluster:/backup fedora:latest tar xzf /backup/user_home.tar.gz
	docker-compose up -d

