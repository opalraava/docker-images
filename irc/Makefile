help :
	@echo 'use: make ssh | remove | build | up | exec | backup | restore | attach | exec | exec-ircd'

ssh :
	-ssh -l user -p 2277 localhost

remove :
	docker-compose down

build :
	docker-compose build

up :
	docker-compose up -d

exec :
	docker exec -it chatbox sh

exec-ircd :
	docker exec -it ircd sh

attach :
	docker attach ircd

backup :
	docker-compose stop
	docker run --rm --volumes-from chatbox -v `pwd`/tarballs:/backup alpine:latest tar czf /backup/user_home.tar.gz /home/user
	sha256sum tarballs/*.gz > tarballs/sha256sum.txt
	docker-compose up -d

restore :
	sha256sum --status -c tarballs/sha256sum.txt
	docker-compose stop
	docker run --rm --volumes-from chatbox -v `pwd`/tarballs:/backup alpine:latest tar xzf /backup/user_home.tar.gz
	docker-compose up -d

