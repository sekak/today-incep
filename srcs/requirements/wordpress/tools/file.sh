 
if [ ! -d "/var/www/wordpress" ]
then
    mkdir /var/www/wordpress 
fi

chmod 777 /var/www/wordpress
 
cd /var/www/wordpress 
 
 
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
  
  wp core download --allow-root
  echo "create wp-config"
  sed -i "s/username_here/${USER}/g" wp-config-sample.php
  sed -i "s/password_here/${USER}/g" wp-config-sample.php
  sed -i "s/localhost/${LOCALHOST}/g" wp-config-sample.php
  sed -i "s/database_name_here/${USER}/g" wp-config-sample.php
  cp wp-config-sample.php wp-config.php

  echo "Installing WordPress deps..."
  wp core install --allow-root --url=https://${DOMAIN_NAME} --title=inception --admin_user=med --admin_password=${ADMIN_PASSWORD} --admin_email=${EMAIL_ADMIN}

#Authors can write, edit, and publish their own posts, but can't modify posts written by other users. They can upload files and add their own images to posts.
  echo "Creating users..."
  wp user create ${EDITOR_USER} ${EMAIL_EDITOR} --role=editor --user_pass=${EDITOR_PASSWORD} --path=/var/www/wordpress --allow-root
 
  # install plugin in wordpress
  wp config set WP_REDIS_PORT "6379" --allow-root
  wp config set WP_REDIS_HOST redis --allow-root

  wp plugin install redis-cache --force --activate --allow-root
  wp redis enable --allow-root

#chown 
chown -R www-data /var/www

else
  echo "Wordpress Already Configured"
fi 

exec "$@" 