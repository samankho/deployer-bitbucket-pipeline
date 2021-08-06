FROM ubuntu:18.04

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get install -q -y php7.4 \
                                        php7.4-fpm \
                                        imagemagick \
                                        php-memcached \
                                        php7.4-soap \
                                        php7.4-cli \
                                        php7.4-curl \
                                        php7.4-dev \
                                        php7.4-gd \
                                        php7.4-mcrypt \
                                        php7.4-zip \
                                        php7.4-xsl \
                                        php7.4-odbc \
                                        php7.4-mbstring \
                                        php-pear \
                                        php7.4-intl \
                                        php7.4-mysql \
                                        php-imagick \
                                        openssh-client \
                                        git \
                                        python-software-properties

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get install -q -y nodejs

RUN npm install -g bower

# Composer
RUN curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

# Deployer
RUN curl -LO https://deployer.org/deployer.phar -o /usr/local/bin/dep

# Make all binaries executable
RUN chmod +x /usr/local/bin/*

CMD ["php-fpm7.4"]