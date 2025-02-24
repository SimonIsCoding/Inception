#using the latest nginx image
FROM	nginx:latest

COPY	./index.html /usr/share/nginx/html/index.thml
COPY	./nginx.conf /etc/nginx/nginx.conf

#Server port
EXPOSE	80

RUN	apk add --no-cache nginx

#Turn nginx on
#try with the command ENTRYPOINT to see thee behavior 
CMD	["nginx", "-g", "deamon off;"]
