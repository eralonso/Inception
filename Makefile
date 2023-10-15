RM := rm -rf
#HOME = $(addsuffix /,$(shell echo $$HOME))
HOME := /home/eralonso/
DATA_DIR := $(addprefix $(HOME),data)
DATA := wordpress_cont wordpress_db
DATA := $(addprefix $(DATA_DIR)/,$(DATA))

all:
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
	@$(RM) $(DATA_DIR)/*/*

re: clean all

.PHONY: all down clean re
