Spring Boot WAR
===============

[![Build Status](https://travis-ci.org/okode/spring-boot-war.svg?branch=master)](https://travis-ci.org/okode/spring-boot-war)

Simple Spring Boot project with WAR packaging.

Running
-------

    $ ./gradlew bootRun

Building WAR
------------

    $ ./gradlew war

Building EAR
------------

    $ ./gradlew ear

Testing
-------

    $ docker run -p 9043:9043 -p 9443:9443 -d ibmcom/websphere-traditional
    $ open https://localhost:9043/ibm/console

Use the following credentials:
* User: wsadmin
* Password: $(docker exec [CONTAINERID] cat /tmp/PASSWORD)

Deploy EAR using admin console and open the following URL:

    $ open https://localhost:9443/war-0.0.1/hello/John

WAS cells directory:

    /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells
