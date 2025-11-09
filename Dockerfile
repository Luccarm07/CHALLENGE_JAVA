#9 0.092 error: Failed to create: /var/cache/yum/metadata
#9 ERROR: process "/bin/sh -c microdnf install -y maven" did not complete successfully: exit code: 1
------
 > [build 4/5] RUN microdnf install -y maven:
0.092 error: Failed to create: /var/cache/yum/metadata
------
Dockerfile:7
--------------------
   5 |
   6 |     # instala o Maven na imagem base
   7 | >>> RUN microdnf install -y maven
   8 |
   9 |     # compila o projeto
--------------------
error: failed to solve: process "/bin/sh -c microdnf install -y maven" did not complete successfully: exit code: 1