sleep 7
sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --path=/var/www/wordpress --allow-root
./wp-cli.phar config create --path=/var/www/wordpress --dbname=$DB --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306 --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$EMAIL --path=/var/www/wordpress --allow-root
./wp-cli.phar user create $WP_USER $WP_EMAIL --user_pass=$WP_PASS --path=/var/www/wordpress --allow-root
mkdir -p /run/php/
php-fpm7.4 -F --nodaemonize

