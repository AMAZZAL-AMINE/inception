all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

build :
	docker-compose -f ./srcs/docker-compose.yml build

show :
	echo "Containers : "
	docker-compose -f ./srcs/docker-compose.yml ps
	echo "Images : "
	docker-compose -f ./srcs/docker-compose.yml  images

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

re: fclean all