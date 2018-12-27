FROM tomcat:8
# Take the war and copy to webapps of tomcat
#COPY target/*.war /usr/local/tomcat/webapps/
COPY /var/lib/jenkins/workspace/FOLDER3/docker-app/target/myweb-0.0.3.war /usr/local/tomcat/webapps/
# Added for jenkins demo
