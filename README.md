## Docker Jenkins

A custome Jenkins image with Node 4 LTS installed, as well as some needed packages.

### Usage Example
```
docker run -d \
  --restart=always \
  --name=jenkins \
  -p 8888:8080 \
  -e JAVA_OPTS=-Duser.timezone="America/Toronto" \
  -v /admin/apps/jenkins:/var/jenkins_home \
  -v /opt/android/sdk:/android/sdk \
  jordond/jenkins

```

### Flags
- `-p xxxx:8080` Remap jenkins webapp port
- `-e JAVA_OPTS=-Duser.timezone="America/Toronto"` Set custom timezone OR use localtime volume
- `-v /path/to/jenkins/home:/var/jenkins_home` Location to store all of jenkins config
- `-v /path/to/android/sdk:/android/sdk` Local Android SDK installation
- `-v /path/to/keystore:/android/keystores` Location of keystores for signing apks
- `-v /etc/localtime:/etc/localtime:ro` Use instead of setting timezone env flag
