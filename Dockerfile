FROM wordpress:4-apache


RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/* 

RUN docker-php-ext-install zip

WORKDIR /usr/src/wordpress/wp-content/plugins

RUN curl -O https://download.civicrm.org/civicrm-4.7.16-wordpress.zip?src=donate

RUN unzip civicrm-4.7.16-wordpress.zip\?src\=donate 

RUN chown -R www-data:www-data /usr/src/wordpress

WORKDIR /var/www/html/
