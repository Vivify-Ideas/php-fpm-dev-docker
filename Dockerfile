FROM vivifyideas/php-fpm-production

# Set working directory
WORKDIR /app

# Copy custom.ini for DEVELOPMENT PURPOSES
# DO NOT USE THIS IN PRODUCTION!
COPY custom.ini /usr/local/etc/php/conf.d/custom.ini

# Install mysql client
RUN apt-get update && apt-get install -y mysql-client
