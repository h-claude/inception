all : setup build start

setup :
	@echo "Setting up the environment..."
	@mkdir -p /home/hclaude/data/wordpress
	@mkdir -p /home/hclaude/data/mariadb
	@resolvectl flush-caches
	@echo "Environment setup complete."

build :
	@echo "Building the containers..."
	@docker-compose -f srcs/docker-compose.yml build
	@echo "Containers built."

start :
	@echo "Starting the containers..."
	@docker-compose -f srcs/docker-compose.yml up -d
	@echo "Containers started."

stop :
	@echo "Stopping the containers..."
	@docker-compose -f srcs/docker-compose.yml down
	@echo "Containers stopped."

fclean :
	@echo "Removing the containers..."
	@sudo docker-compose -f srcs/docker-compose.yml kill
	@sudo docker-compose -f srcs/docker-compose.yml rm -f
	@sudo docker system prune -a --volumes -f
	@sudo rm -rf /home/hclaude/data
	@sudo resolvectl flush-caches
	@echo "Containers removed."
