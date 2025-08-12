FROM ubuntu:24.04

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
        apt install -y software-properties-common curl git openssh-client && \
        add-apt-repository ppa:ondrej/php && \
        apt update && \
        apt install -y \
                php8.4 \
                php8.4-soap \
                php8.4-cli \
                php8.4-curl \
                php8.4-dev \
                php8.4-gd \
                php8.4-zip \
                php8.4-xsl \
                php8.4-odbc \
                php8.4-mbstring \
                php8.4-intl \
                php8.4-mysql \
                php-imagick \
                php-memcached \
                php-pear \
                imagemagick
                
RUN curl -sSL https://deb.nodesource.com/setup_16.x | bash - && \ 
        apt update && apt install -y nodejs

# Bower (global npm packages)
RUN npm install -g bower

# Composer
RUN curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

# Deployer
RUN curl -LO https://deployer.org/deployer.phar -o /usr/local/bin/dep

# Make all binaries executable
RUN chmod +x /usr/local/bin/*

CMD ["php-fpm8.4"]