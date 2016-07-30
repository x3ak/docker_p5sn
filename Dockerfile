FROM webdevops/php-apache-dev:debian-8

MAINTAINER Marius Tamazlicaru "tamazlicaru@yahoo.com"

RUN grep -rl ';date.timezone =' /etc/php5/cli/php.ini | xargs sed -i 's/;date.timezone =/date.timezone = "Europe\/Chisinau"/g'
RUN apt-get update && apt-get install -y zsh \
    && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

ADD app.conf /etc/apache2/sites-available/000-default.conf
ADD set-permissions.sh /tmp/set-permissions.sh

RUN a2ensite 000-default && a2enmod proxy_fcgi && service apache2 restart

WORKDIR /app
