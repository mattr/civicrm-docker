FROM wordpress:4-apache


RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/* 

WORKDIR /usr/src/wordpress/wp-content/wp-plugins

RUN curl -O https://download.civicrm.org/civicrm-4.7.16-wordpress.zip?src=donate

RUN unzip civicrm-4.7.16-wordpress.zip\?src\=donate 

WORKDIR /var/www/html/
