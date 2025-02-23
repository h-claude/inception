RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[0;33m
DARK_BLUE=\033[0;34m
NC=\033[0m

all : setup build start

setup :
	@echo "$(DARK_BLUE)Setting up the environment...$(NC)"
	@sudo mkdir -p /home/hclaude/data/wordpress
	@sudo mkdir -p /home/hclaude/data/mariadb
	@sudo resolvectl flush-caches
	@echo "✅$(DARK_BLUE)Environment setup complete.$(NC)✅"

build :
	@echo "$(DARK_BLUE)Building the containers...$(NC)"
	@sudo docker-compose -f srcs/docker-compose.yml build
	@echo "✅$(DARK_BLUE)Containers built.$(NC)✅"

start :
	@echo "$(GREEN)Starting the containers...$(NC)"
	@sudo docker-compose -f srcs/docker-compose.yml up -d
	@echo "✅$(GREEN)Containers started.$(NC)✅"

stop :
	@echo "$(YELLOW)Stopping the containers...$(NC)"
	@sudo docker-compose -f srcs/docker-compose.yml down
	@echo "🛑$(YELLOW)Containers stopped.$(NC)🛑"

fclean :
	@echo "$(RED)Removing the containers...$(NC)"
	@sudo docker-compose -f srcs/docker-compose.yml kill
	@sudo docker-compose -f srcs/docker-compose.yml rm -f
	@sudo docker system prune -a --volumes -f
	@sudo rm -rf /home/hclaude/data
	@sudo resolvectl flush-caches
	@echo "✅$(RED)Containers removed.$(NC)✅"
