service mariadb start
sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL ON $DB.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" 
mariadb -e "FLUSH PRIVILEGES;"

sed -i '/bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb stop

mysqld_safe
