# Docker-окружение для разработки на Bitrix

[![PHP 8.3](https://img.shields.io/badge/PHP-8.3-777BB4?logo=php)](https://php.net/)
[![MySQL 8.0](https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql)](https://mysql.com/)
[![Nginx 1.20](https://img.shields.io/badge/Nginx-1.20-269539?logo=nginx)](https://nginx.org/)

Полностью изолированная Docker-среда для разработки проектов на **1С-Битрикс** с поддержкой PHP 8.3, Nginx и MySQL 8.0.

## 📦 Состав окружения

- **PHP 8.3 FPM** (на базе Alpine Linux)
- **Nginx 1.20** (на базе Alpine Linux)
- **MySQL 8.0**
- **Xdebug 3** для отладки
- **Composer 2.8** для управления зависимостями
- Автоматическая настройка прав доступа
- Инструменты мониторинга (логи, healthchecks)

## 🚀 Быстрый старт

1. Клонируйте репозиторий:

```bash
   git clone https://github.com/resolution07/dockerbx83.git
   cd dockerbx83
   ```

2. Скопируйте `.env.example` в `.env`

3. Соберите и запустите контейнеры:

```bash
   make build-up
   ```

4. После запуска проект будет доступен по адресу:

```
http://localhost
```

## 🛠 Управление окружением

### 🚀 Основные команды

- `make build` — сборка Docker-образов без запуска
- `make up` — запуск контейнеров в фоновом режиме
- `make build-up` — сборка + запуск (рекомендуется для первого запуска)
- `make down` — остановка всех контейнеров
- `make reload` — перезагрузка контейнеров без downtime

### 🐞 Отладка и логи

- `make php-bash` — вход в PHP-контейнер (интерактивный bash)
- `docker-compose logs -f nginx` — просмотр логов Nginx в реальном времени
- `docker-compose logs -f php-fpm` — мониторинг PHP-FPM логов
- `make remove-logs` — очистка всех логов (требует sudo)

### ⚙️ Управление сервисами

- `docker-compose restart nginx` — перезапуск конкретного сервиса
- `docker-compose ps` — проверка статуса контейнеров
- `docker-compose exec php-fpm composer update` — обновление зависимостей

### 🔐 Переменные окружения (через `.env`)

```ini
DB_USERNAME=bitrix
DB_PASSWORD=FB0pr297)R{Env
DB_DATABASE=bitrix_db
```

### 📝 Логи

Логи доступны в соответствующих директориях:

- `Nginx`: `docker/nginx/log/`
- `PHP-FPM`: `docker/php-fpm/log/`

### 📌 Особенности

- Оптимизированные Alpine-образы
- Автоматическая установка прав для Битрикс
- Готовые health-чеки для мониторинга
- Поддержка .env-файлов для конфигурации