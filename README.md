# Web-SpringMVC-BoilerPlate

Spring MVC Project that consumes REST APIs and produces a front end view using ReactJS for the purposes of learning how Spring MVC works and the process of pulling data and using it in a meaningful way.

To get the project working, it requires the first project "RestAPI-SpringBoot-BoilerPlate" to be downloaded, configured and running for the frontend to call and pull the API data.

- Simply clone the repository into your local directory.
- Then start up the IDE of your choice, any that supports Maven (JBoss, Spring Tool Suite, NetBeans, etc).
- Choose open existing projects from file system, then navigate to the cloned project.
- The IDE should then create the necessary settings for the project and allow you to create work with the files.
- Create a new local server for the webapp to reside (Tomcat, etc) and change the port to something other than 8080 (this is the port the backend API will use.
- When the server is set up, run the server and the webapp will automatically build.
- Enabled CircleCI autobuild on commit for master and public_access branch
