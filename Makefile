NAME = inception

# define cmd =
# 	sudo docker stop \$(sudo docker ps -a -q); \
# 	sudo docker rm \$(sudo docker ps -a -q);\
# 	sudo docker rmi \$(sudo docker images -q);\
# 	sudo docker volume rm \$(sudo docker volume ls -q)
# endef

all:
	@echo "build images..."
	@sh ./srcs/requirements/tools/file.sh
	@sudo docker-compose  -p $(NAME) -f ./srcs/docker-compose.yaml up --build -d

 
clean:    
	@echo "stop and remove the containers, networks, and volumes that are created by docker-compose up."
	@sudo docker-compose -f ./srcs/docker-compose.yaml down 


fclean: clean 
	@echo "remove volumes directory"
	@sudo rm -rf /home/asekkak/data
	@sudo docker builder prune -a -f
	@sudo docker-compose -p $(NAME) -f srcs/docker-compose.yaml down -v --remove-orphans

re: fclean all

.PHONY: re fclean clean     all 