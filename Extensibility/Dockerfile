FROM base-ss:oracle6-tomcat7-java7
MAINTAINER "Eric Allen <eric.allen@usu.edu>"

RUN mkdir -p /opt/xe/extensibility/pb \
  && mkdir -p /opt/xe/extensibility/pb/i18n \
  && mkdir -p /opt/xe/extensibility/pb/page \
  && mkdir -p /opt/xe/extensibility/pb/css \
  && mkdir -p /opt/xe/extensibility/pb/virtdom \
  && mkdir -p /opt/xe/extensibility/themes

COPY BannerExtensibility.war /usr/local/tomcat/webapps/BannerExtensibility.war
