FROM debian:bookworm

RUN apt update 

RUN apt install nodejs -y
 
RUN mkdir file && cd file

COPY ./tools .
 
CMD [ "node", "index.js" ]

 