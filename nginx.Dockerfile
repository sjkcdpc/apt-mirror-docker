FROM nginx:1.17-alpine

LABEL Maintainer="mdscdpc@gmail.com" \
      Description="Node based on Alpine Linux."

ENV TZ=Asia/Shanghai

RUN sed -i.bak 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk --no-cache add zip unzip tzdata

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx.conf /etc/nginx/conf.d/mirror.conf
