FROM wordpress:4-apache

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/* 

RUN docker-php-ext-install zip

WORKDIR /usr/src/wordpress/wp-content/plugins

ENV CIVICRM_VERSION 4.7.24
ENV CIVICRM_STRIPE_VERSION 4.7.2
ENV CIVICRM_WP_MEMBER_VERSION 0.3.2

RUN curl -o civicrm-wordpress.zip -OL https://download.civicrm.org/civicrm-${CIVICRM_VERSION}-wordpress.zip

RUN unzip civicrm-wordpress.zip

RUN curl -o civicrm-stripe.zip -O https://codeload.github.com/drastik/com.drastikbydesign.stripe/zip/${CIVICRM_STRIPE_VERSION}

RUN mkdir -p ../uploads/civicrm/ext/

RUN unzip civicrm-stripe.zip -d ../uploads/civicrm/ext/

RUN mv ../uploads/civicrm/ext/com.drastikbydesign.stripe-${CIVICRM_STRIPE_VERSION}/ ../uploads/civicrm/ext/com.drastikbydesign.stripe 

RUN curl -o civicrm-wp-member-sync.zip -O https://downloads.wordpress.org/plugin/civicrm-wp-member-sync.${CIVICRM_WP_MEMBER_VERSION}.zip

RUN unzip civicrm-wp-member-sync.zip 

RUN chown -R www-data:www-data /usr/src/wordpress

WORKDIR /var/www/html/
