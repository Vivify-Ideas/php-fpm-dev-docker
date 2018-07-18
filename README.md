# Docker image for php-fpm in development environment

Highlights:

- All PHP modules needed for Laravel development
- Composer embedded in container
- Mysql client embedded in container

#### How to use ?
In your docker-compose file just pull this image and bind source code of your project to `/app` in container.

# DO NOT USE THIS IMAGE IN PRODUCTION
> In case that you want to use this image in production, please remove or override `custom.ini`
