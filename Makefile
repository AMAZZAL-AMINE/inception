all:
	mkdir -p ./srcs/requirements/nginx/tools
	cp /home/$(USER)/cert/* ./srcs/requirements/nginx/tools
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	rm -rf ./srcs/requirements/nginx/tools
	@docker-compose -f ./srcs/docker-compose.yml down

fclean:
	rm -rf ./srcs/requirements/nginx/tools
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

re: fclean all