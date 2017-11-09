#Dockerfile for base-admin Java 8 & tomcat 8
FROM oraclelinux:6
MAINTAINER "Eric Allen <eric.allen@usu.edu>"

RUN yum install tar -y

ENV JAVA_VERSION=8u151 \
    JAVA_BNUMBER=12 \
    JAVA_SEMVER=1.8.0_151 \
    JAVA_HOME=/opt/jre-home \
    JAVA_RANDOM=e758a0de34e24606bca991d704f6dcbf \
    TIMEZONE=America/Denver


RUN cd / \
    && curl --header "Cookie: oraclelicense=accept-securebackup-cookie" -fSL \
    http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-b$JAVA_BNUMBER/$JAVA_RANDOM/server-jre-$JAVA_VERSION-linux-x64.tar.gz \
    -o server-jre-$JAVA_VERSION-linux-x64.tar.gz \
    && tar -zxf server-jre-$JAVA_VERSION-linux-x64.tar.gz -C /opt \
    && rm server-jre-$JAVA_VERSION-linux-x64.tar.gz \
    && ln -s /opt/jdk$JAVA_SEMVER/ /opt/jre-home;

ENV PATH=$PATH:$JAVA_HOME/bin
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN mkdir -p "$CATALINA_HOME" && chown tomcat:tomcat "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# see https://www.apache.org/dist/tomcat/tomcat-8/KEYS
RUN  for key in \
                05AB33110949707C93A279E3D3EFE6B686867BA6 \
                07E48665A34DCAFAE522E5E6266191C37C037D42 \
                47309207D818FFD8DCD3F83F1931D684307A10A5 \
                541FBE7D8F78B25E055DDEE13C370389288584E7 \
                61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
                713DA88BE50911535FE716F5208B0AB1D63011C7 \
                79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
                9BA44C2621385CB966EBA586F72C284D731FABEE \
                A27677289986DB50844682F8ACB77FC2E86E29AC \
                A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
                DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
                F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
                F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 \
        ; do \
                gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
        done

ENV TOMCAT_MAJOR=8
ENV TOMCAT_VERSION=8.0.47
ENV TOMCAT_TGZ_URL=https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz


RUN set -x \
  && curl -fSL $TOMCAT_TGZ_URL -o tomcat.tar.gz \
        && curl -fSL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc \
        && gpg --batch --verify tomcat.tar.gz.asc tomcat.tar.gz \
        && tar -xvf tomcat.tar.gz --strip-components=1 \
        && rm bin/*.bat \
        && rm tomcat.tar.gz* \
  && rm -rf webapps/* \
  && chown -R tomcat:tomcat $CATALINA_HOME

ENV XMS=2048m \
    XMX=4g \
    MAXPERMSIZE=1024m \
    BANPROXY_JDBC_URL=jdbc:oracle:thin:@//oracle.example.edu:1521/prod \
    BANPROXY_PASSWORD=password \
    BANPROXY_INITIALSIZE=25 \
    BANPROXY_MAXACTIVE=100 \
    BANPROXY_MAXIDLE=-1 \
    BANPROXY_MAXWAIT=30000 \
    LOGFILEDIR=/usr/local/tomcat/logs \
    SCHEME=https\
    PROXY_PORT=443 \
    PROXY_NAME=host.example.edu


ENV JAVA_OPTS -Duser.timezone=\$TIMEZONE \
    -Dlog4j.configuration=config.properties -Xms\$XMS -Xmx\$XMX \
    -Dbanproxy.jdbc.url=\$BANPROXY_JDBC_URL \
    -Dbanproxy.password=\$BANPROXY_PASSWORD \
    -Dbanproxy.initialsize=\$BANPROXY_INITIALSIZE \
    -Dbanproxy.maxactive=\$BANPROXY_MAXACTIVE \
    -Dbanproxy.maxidle=\$BANPROXY_MAXIDLE \
    -Dbanproxy.maxwait=\$BANPROXY_MAXWAIT \
    -Dscheme=\$SCHEME \
    -Dproxy.port=\$PROXY_PORT \
    -Dproxy.name=\$PROXY_NAME

COPY ojdbc7.jar /usr/local/tomcat/lib/ojdbc6.jar
COPY context.xml /usr/local/tomcat/conf/context.xml
COPY server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080
USER tomcat
CMD ["catalina.sh", "run"]
