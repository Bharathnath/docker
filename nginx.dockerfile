FROm centos:centos7
LABEL maintainer="vicente Zependa <chente.z.m@gmail.com>"

ENV nginxversion="1.14.0-1"\
    os="centos" \
    osversion="?" \
    elversion="7_4"
RUN yum install -y wget openssl sed &&\
    yum -y autoremove &&\
    yum clean all &&\
    wget htt://nginx.org/packages/$os/$osversion/x86_64/RPMS/nginxversion.el$elversion.ngx.x86_6.rpm &&\
    rpm -iv nginx-$nginxversion.el$elversion.ngx.86_64.rpm

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /data/www/index.html
VOLUME [ "/data/www" ]
EXPOSE 80

CMD ["nginx". "-g". "daemon off:"]


