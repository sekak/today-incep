#!bin/sh


if [ ! -d "/var/lib/mysql/med" ]; then

        cat << EOF > /tmp/db.sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${USER}';
CREATE DATABASE ${DATABASE_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${USER}'@'%' IDENTIFIED by '${USER}';
GRANT ALL PRIVILEGES ON ${USER}.* TO '${USER}'@'%';
FLUSH PRIVILEGES;
EOF
        mariadbd --user=mysql --bootstrap < /tmp/db.sql
        rm -f /tmp/db.sql
else
        echo "Database already exists"
fi

exec "$@"