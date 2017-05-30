# Build the Docker image using the command "docker build -t forgerock/openig-base ."
# Get tomcat
FROM tomcat:8.5-jre8

# SET env variables
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH


# The default home for OpenIG config. To set a different location, override these values.
ENV OPENIG_BASE /var/openig
WORKDIR $CATALINA_HOME


# Remove unecessary information from Tomcat
RUN rm -fr webapps/*


# Note: By default Tomcat does NOT listen on 8443. Add a custom server.xml file to change this.
EXPOSE 8080 8443


# Add the downloaded .war file to the working directory
ADD openig.war /tmp/openig.war


RUN unzip /tmp/openig.war -d /usr/local/tomcat/webapps/ROOT \
 && rm -f /tmp/*zip
