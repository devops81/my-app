FROM tomcat:8

# Take the war and copy to webapps of tomcat

COPY /opt/atlassian/bhome/xml-data/build-dir/WEB-WEB-JOB1/target/myweb-0.0.3.war  /usr/local/tomcat/webapps/


# Added for jenkins demo
