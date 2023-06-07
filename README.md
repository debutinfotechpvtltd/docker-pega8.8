# Here is some steps to configure Pega on docker.
## 1. Prequesisties to configure Pega8.8 on docker.
  1. Docker and docker-compose should be intsalled on System
  2. You should have all access to run Docker command on your system.
  3. Port 5434,8081 and 8080 should not occupied from any service.
## 2.Installation

  1. Do git clone of this repo. 
  2. git clone https://github.com/debutinfotechpvtltd/docker-pega8.8.git
  3. Download Pega8.8 build support files & folders (archives, rules and scripts) from the below URL in the same folder where you cloned the github data.
   https://drive.google.com/file/d/1jiv3tP9wY_0pT0Bmf3iCPBbl5gQU9Cr1/view?usp=sharing <br />
   or <br />
   you can download Pega Prpc 8.8 from Offical webiste and extract these(archives, rules and scripts) three folder from the Prpc Zip file and move in the same folder where    your DockerFile is exist. Below are some steps to download Pega personal edition. <br />
   Pega.com > Support > Download Pega Software > [Download Personal Edition](https://community1.pega.com/digital-delivery)
  4. Edit .env file according your requirments.
  5. If you windows user run "windows-setup.ps1" file to configure everything in one go. If you Linux   user run "linux-setup.sh" script file.
  6. Wait for 40 minutes to configure everthing.
  7. Check Docker conatiner status with the command "docker ps -a"
  8. Once pega-web container up. You can access pega application with the url "http://127.0.0.1:8080/prweb"
  9. You can access Pgadmin on browser with the url "http://127.0.0.1:8081"

## Note:- Pega-installer container will be exited state once everything configured which is expected and you can ignore it.

## License 
This project is currently under MIT license.

