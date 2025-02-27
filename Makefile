DATA_VOLUME=/home/hclaude/data
MARIADB_VOLUME=/home/hclaude/data/mariadb
WORDPRESS_VOLUME=/home/hclaude/data/wordpress

RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[0;33m
DARK_BLUE=\033[0;34m
NC=\033[0m

all : setup build start

setup :
	@echo "$(DARK_BLUE)Setting up the environment...$(NC)"
	@mkdir -p $(WORDPRESS_VOLUME)
	@mkdir -p $(MARIADB_VOLUME)
	@resolvectl flush-caches
	@echo "✅$(DARK_BLUE)Environment setup complete.$(NC)✅"

build : setup
	@echo "$(DARK_BLUE)Building the containers...$(NC)"
	@docker-compose -f srcs/docker-compose.yml build
	@echo "✅$(DARK_BLUE)Containers built.$(NC)✅"

start : build
	@echo "$(GREEN)Starting the containers...$(NC)"
	@docker-compose -f srcs/docker-compose.yml up -d
	@echo "✅$(GREEN)Containers started.$(NC)✅"

stop :
	@echo "$(YELLOW)Stopping the containers...$(NC)"
	@docker-compose -f srcs/docker-compose.yml down
	@echo "🛑$(YELLOW)Containers stopped.$(NC)🛑"

fclean :
	@echo "$(RED)Removing the containers...$(NC)"
	@docker-compose -f srcs/docker-compose.yml kill
	@docker-compose -f srcs/docker-compose.yml rm -f
	@docker system prune -a --volumes -f
	@rm -rf $(DATA_VOLUME)
	@resolvectl flush-caches
	@echo "✅$(RED)Containers removed.$(NC)✅"
