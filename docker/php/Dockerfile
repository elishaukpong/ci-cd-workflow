FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

USER root

RUN apt update && apt -f install -y

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# sudo www-data
RUN echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER www-data
