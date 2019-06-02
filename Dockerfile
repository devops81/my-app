FROM tomcat:8

# Take the war and copy to webapps of tomcat

RUN cp /var/lib/jenkins/workspace/Docker\ Job/target/myweb-0.0.3.war /usr/local/tomcat/webapps/

# Added for jenkins demo
