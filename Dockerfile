FROM nginx:latest
MAINTAINER "sudhams reddy duba <dubareddy.383@gmail.com>"
RUN apt update && apt dist-upgrade -y
COPY default.conf /etc/nginx/conf.d/
COPY src/certs/ /etc/ssl/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
