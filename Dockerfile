FROM tomcat
COPY FirstWebApp.war /usr/local/tomcat/webapps/
#CMD ["java","-jar","FirstWebApp.jar"]