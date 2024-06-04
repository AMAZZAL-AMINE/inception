all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker-compose -f ./srcs/docker-compose.yml down

fclean:
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

re: fclean all