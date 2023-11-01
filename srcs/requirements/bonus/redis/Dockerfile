FROM debian:bookworm

RUN apt-get -y update && apt install redis-server -y  


#configure it to use a maximum of 256MB of memory
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf

#when memory full , this "allkeys-lru" remove the least recently used keys in order to free up memory.
RUN  echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

#change configure redis to listen any ip  rather listen specifier ip
RUN sed -i   "s/#bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis.conf


# RUN   nano /etc/sysctl.conf && echo "vm.overcommit_memory = 1" > /etc/sysctl.conf

CMD ["redis-server", "--protected-mode", "no"]
#redis-server command is used to start the Redis server,
#The --protected-mode option specifies whether the Redis server should run in protected mode or not
#By specifying the no argument, the --protected-mode option disables protected mode and allows the Redis server to accept connections from clients running on any host.

