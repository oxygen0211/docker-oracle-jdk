# oracle jdk docker base image

To use as a base image for running java applications

When building images based on this, they should contain a start script or command doing something like

```
java -jar /path/to/your/main/jar
```
or however your application, container or whatever needs to be started
