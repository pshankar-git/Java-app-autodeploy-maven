FROM tomcat:8
# Take the war and copy to webapps of Tomcat
COPY target/*.war /usr/local/tomcat/webapps/
