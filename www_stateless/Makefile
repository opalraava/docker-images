container_name=www_stateless

#

help :
	@echo 'use: make ssh | remove | build | up | exec'

ssh :
	-ssh -l user -p 2292 -X localhost

remove :
	docker-compose down

build :
	docker-compose build

up :
	docker-compose up -d

exec :
	docker exec -it ${container_name} sh
