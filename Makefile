build:
	docker-compose build

run:
	docker-compose up -d

build-run:
	docker-compose up -d --build

down:
	docker-compose down

php-bash:
	docker-compose exec php-fpm /bin/sh

remove-logs:
	echo "Remove logs..."
	sudo rm -rf ./docker/nginx/log/* ./docker/php-fpm/log/*