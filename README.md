# dockerfile-examples

This GitHub project hosts a collection of Dockerfiles to show how you could use them as-is or build your own Dockerfiles to be used with Docker on Linux on IBM Z.

# License

dockerfile-examples is licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

# Jenkins
http://9.42.135.177:8080/job/ClairScanner/job/Linux-on-Z%20Dockerfiles/

Pipeline creates dynamically named stages for builds - scanning for vulnerabilities when successful. 

`Alfresco - hangs`

`Antlr - fails on last step:
Step 13/14 : COPY --from=builder $SOURCE_ROOT/node-v12.14.1-linux-s390x $SOURCE_ROOT/node-v12.14.1-linux-s390x
failed to copy files: failed to copy directory: Error processing tar file(exit status 1): Container ID 101002 cannot be mapped to a host ID`

