#Using the archetype

##Clone and build the archetype
    $ git clone git@github.com:niqbal/vanilla-jsp-archetype.git
    $ cd vanilla-jsp-archetype
    $ mvn install

This will install the archetype locally, and you will be able to generate projects from it. 

##Create your project
Go to a directory where you'd like to create your project.

Generate from the archetype:
    $ mvn archetype:generate 

This will print a list of locally installed archetypes, choose vanilla-jsp-archetype from the list.

Follow the prompts and choose your values for groupId, artifactId, version, and base package

Your project will be created in a directory named for your artifact id. 

##Build your project

After this you should set the connection string for environment variable `FORCE_FORCEDATABASE_URL`. 
Then you can run your project:
    
    mvn tomcat:run-war

