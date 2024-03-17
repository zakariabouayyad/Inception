all :
	docker-compose -f srcs/docker-compose.yml up --build 
clean :
	docker compose -f srcs/docker-compose.yml down && sudo rm -rf /home/zbouayya/data/mariadb/* && sudo rm -rf /home/zbouayya/data/wordpress/*
fclean :
	docker system prune -a && sudo rm -rf /home/zbouayya/data/mariadb/* && sudo rm -rf /home/zbouayya/data/wordpress/*
