FROM jboss/keycloak:15.0.2
USER jboss

# Do the trick:
# <property name="initializeEmpty" value="true"/> --> <property name="initializeEmpty" value="manual"/>
RUN sed -i -e 's/<property name="initializeEmpty" value="true"\/>/<property name="initializeEmpty" value="false"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml
RUN sed -i -e 's/<property name="migrationStrategy" value="update"\/>/<property name="migrationStrategy" value="manual"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml
RUN sed -i -e 's/<property name="migrationExport" value="\${jboss.home.dir}\/keycloak-database-update.sql"\/>/<property name="migrationExport" value="\/tmp\/20_keycloak_15.0.2.sql"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml

RUN sed -i -e 's/<property name="initializeEmpty" value="true"\/>/<property name="initializeEmpty" value="false"\/>/' $JBOSS_HOME/standalone/configuration/standalone-ha.xml
RUN sed -i -e 's/<property name="migrationStrategy" value="update"\/>/<property name="migrationStrategy" value="manual"\/>/' $JBOSS_HOME/standalone/configuration/standalone-ha.xml
RUN sed -i -e 's/<property name="migrationExport" value="\${jboss.home.dir}\/keycloak-database-update.sql"\/>/<property name="migrationExport" value="\/tmp\/20_keycloak_15.0.2.sql"\/>/' $JBOSS_HOME/standalone/configuration/standalone-ha.xml

#RUN sed -i -e 's/<property name="initializeEmpty" value="true"\/>/<property name="initializeEmpty" value="false"\/>/' $JBOSS_HOME/domain/configuration/domain.xml
#RUN sed -i -e 's/<property name="migrationStrategy" value="update"\/>/<property name="migrationStrategy" value="manual"\/>/' $JBOSS_HOME/standalone/configuration/domain.xml
#RUN sed -i -e 's/<property name="migrationExport" value="\${jboss.home.dir}\/keycloak-database-update.sql"\/>/<property name="migrationExport" value="\/tmp\/20_keycloak_15.0.2.sql"\/>/' $JBOSS_HOME/standalone/configuration/domain.xml

#<properties>
#    <property name="dataSource" value="java:jboss/datasources/KeycloakDS"/>

#    <property name="initializeEmpty" value="true"/>
#    <property name="migrationStrategy" value="update"/>
#    <property name="migrationExport" value="${jboss.home.dir}/keycloak-database-update.sql"/>

#    <property name="schema" value="${env.DB_SCHEMA:public}"/>
#</properties>
