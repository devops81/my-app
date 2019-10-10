FROM tomcat:8

# Take the war and copy to webapps of tomcat

COPY /home/cloud_user/myweb-0.0.3.war  /usr/local/tomcat/webapps/


# Added for jenkins demo
