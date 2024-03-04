.PHONY: all up down re fclean

all : up

up :
	cd ./srcs && docker-compose up --build -d

down :
	cd ./srcs && docker-compose down -v

clean :
	cd ./srcs && docker-compose down -v
	rm -rf /Users/sejokim/Desktop/volumes/mariadb_data/
	rm -rf /Users/sejokim/Desktop/volumes/wp_data/

re : clean all

fclean: clean
	docker system prune
