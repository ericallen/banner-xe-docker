# Banner XE Dockerfiles

## Quickstart guide
1. Download and place ojdbc6.jar and xdb6.jar in each of the base image directories you want to use.  
2. build base images
```
docker build -t base-admin:ol6-tomcat7-java7 base-admin/ol6-tomcat7-java7 .
docker build -t base-admin:ol6-tomcat8-java8 base-admin/ol6-tomcat8-java8 .
docker build -t base-ss:ol6-tomcat7-java7 base-ss/ol6-tomcat7-java7 .
docker build -t base-ss:ol6-tomcat8-java8 base-ss/ol6-tomcat8-java8 .
```
3. Build XE application through ESM or Manually
4. Move build war file into corresponding directory
5. Build XE application docker image
6. Run container with ENV config
7. Connect in LB


These containers are designed to behind a load balancer and should not be connected to directly.


## Example with Application Navigator

1. Build base-ss image

    ```
    docker build -t base-ss:ol6-tomcat7-java7 base-ss/ol6-tomcat7-java7/.
    ```

2. Copy built applicationNavigator.war into applicationNavigator/
3. Build Application Navigator

  ```
  docker build -t applicationNavigator:2.0.1 ApplicationNavigator/. ```

4. Run container

 ```
 docker run -e "BANPROXY_JDBC_URL=jdbc:oracle:thin:@//oracle.example.edu:1521/prod" -e "BANPROXY_PASSWORD=password" -e "TIMEZONE=America/Denver" appliationNavigator:2.0.1 -d
 ```

## Banner XE Self Service applications

There are currently two base-ss images base-ss:ol6-tomcat7-java7 and base-ss:ol6-tomcat8-java8, this is to be compliant with Ellucian's applications server requirements.

Oracle Java is being used in these images and by using them you are agreeing to Oracle's java use agreements.

JAVA_HOME is /opt/jre-home

### Required Environmental Variables

* BANPROXY_JDBC_URL=jdbc:oracle:thin:@//oracle.example.edu:1521/prod
BANPROXY_PASSWORD=password

* BANSSUSER_JDBC_URL=jdbc:oracle:thin:@//oracle.example.edu:1521/prod
BANSSUSER_PASSWORD=password


### Optional Environmental Variables
* TIMEZONE=America/Denver
* XMS=2048m
* XMX=4g
* MAXPERMSIZE=384m
* BANPROXY_INITIALSIZE=5
* BANPROXY_MAXACTIVE=100
* BANPROXY_MAXIDLE=-1
* BANPROXY_MAXWAIT=30000
* BANSSUSER_INITIALSIZE=5
* BANSSUSER_MAXACTIVE=100
* BANSSUSER_MAXIDLE=-1
* BANSSUSER_MAXWAIT=30000
* LOGFILEDIR=/usr/local/tomcat/logs

### Volumes

There are two locations that you will want to create attach a volume for photos and extensibility.  Currently /opt/xe/images is created in the base-ss images.  Then in the extensibility Dockerfile creates out the /opt/xe/extensibility to hold the local files.



## Banner XE Admin Applications

### Required Environmental Variables

* BANPROXY_JDBC_URL=jdbc:oracle:thin:@//oracle.example.edu:1521/prod
BANPROXY_PASSWORD=password

### Optional Enviornmental Variables
* TIMEZONE=America/Denver
* XMS=2048m
* XMX=4g
* MAXPERMSIZE=384m
* BANPROXY_INITIALSIZE=5
* BANPROXY_MAXACTIVE=100
* BANPROXY_MAXIDLE=-1
* BANPROXY_MAXWAIT=30000
* BANSSUSER_INITIALSIZE=5
* BANSSUSER_MAXACTIVE=100
* BANSSUSER_MAXIDLE=-1
* BANSSUSER_MAXWAIT=30000
* LOGFILEDIR=/usr/local/tomcat/logs



# TODO
- [ ] Shrink images
- [ ] Base images using alpine
- [ ] boot script to customize XE application (so image can be used across environments)
- [ ] Docker Compose example
- [ ] Rancher compose example
- [ ] Kubernetes example
