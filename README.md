Spring Boot WAR
===============

Simple Spring Boot project with WAR packaging.

Running
-------

    $ ./gradlew bootRun

Building WAR
------------

    $ ./gradlew war

Testing
-------

    $ docker run --name test -h test -p 9043:9043 -p 9443:9443 -d ibmcom/websphere-traditional:8.5.5.9-profile
    $ open https://localhost:9043/ibm/console/login.do?action=secure

    Use the following credentials:
    * User: wsadmin
    * Password: $(docker exec test cat /tmp/PASSWORD)

    Deploy EAR

    $ open https://localhost:9443/war-0.0.1/hello/John
