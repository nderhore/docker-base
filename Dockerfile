# Etape 1 : récuperer l'image php-fpm
FROM php:8.2-fpm as php-fpm

# Definir le repertoire de travail
# mkdir -r /var/www/html && cd
WORKDIR /var/www/html

# Copier le fichier php , mon projet dans le container
COPY index.php .

# Etape 2 : nginx
FROM nginx:1.27

# Copier la configuration Nginx
COPY config/default.conf /etc/nginx/conf.d/default.conf

COPY --from=php-fpm /var/www/html /var/www/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]


