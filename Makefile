build:
	docker-compose build

up:
	docker-compose up -d

build-up:
	docker-compose up -d --build

down:
	docker-compose down

reload:
	docker-compose reload

php-bash:
	docker-compose exec php-fpm /bin/sh

remove-logs:
	echo "Remove logs..."
	sudo rm -rf ./docker/nginx/log/* ./docker/php-fpm/log/*