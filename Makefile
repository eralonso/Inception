RM := rm -rf
HOME := /home/eralonso/
DATA_DIR := data
DATA_DIR := $(addprefix $(HOME),$(DATA_DIR))
DATA := wordpress_cont wordpress_db
DATA := $(addprefix $(DATA_DIR)/,$(DATA))

all: $(DATA)
	docker compose -f ./srcs/docker-compose.yml up -d --build

$(DATA_DIR)/%:
	@mkdir -p $@

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	-@docker stop $$(docker ps -qa)
	-@docker system prune --all --force
	-@docker volume prune --all --force
	-@docker volume rm $$(docker volume ls -q)
	@$(RM) $(DATA_DIR)

re: clean all

.PHONY: all down clean re
