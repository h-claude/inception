FROM debian:bullseye

RUN	apt update && \
	apt upgrade -y && \
	apt install -y nginx && \
	apt install -y curl && \
	apt install -y openssl && \
	mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=GDEST/L=Mulhouse/O=42/OU=42/CN=hclaude.42.fr/UID=hclaude" && \
	mkdir -p /var/run/nginx && \
	chown -R www-data:www-data /var/run/nginx && \
	apt clean && \
	mkdir -p /var/www/html && \
	chmod 755 /var/run/nginx

RUN	chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY	conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx","-g","daemon off;"]
