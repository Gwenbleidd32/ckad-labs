# CKAD Practice Questions

This Repository contains my collection of CKAD questions collected from scalping killer.sh exams.
I've created shell scripts to provision the enviornments necessary to complete some of these questions/
After using a shell script to create an enviornment please recreate and initiate a new enviornment.

Please Create an account at the below link to have access to free clusters to practice these questions.
I recommend you the CKAD enviornment, and also practice the premade labs they have as well to sharpen your skills.

- Navigate here to open a free CKAD lab enviornment to work on this challenge:
- https://killercoda.com/

---
### Challenge Question 1
The board of team Neptune decided to take over control of a server running in the `default` namespace.

The admin who once setup this webserver is not part of the organization any longer. All the information you could get was that the application contains a system called `parser`. 

Search for the application containing the parser system and migrate it into the `neptune` namespace.


*Git clone this repository to setup this lab and follow the below steps:*
```shell
git clone https://github.com/Gwenbleidd32/ckad-labs.git

cd ckad-labs

chmod +x migrate.sh

./migrate.sh
```

These steps will setup the environment required for this question:.

The answer to this question will be posted at a later date!

---

### Challenge Question 2 
There is an existing Deployment named api-new-c32 in Namespace `neptune`. 
A Developer recently made an update to the Deployment but the updated version never came online.

Check the deployment history and find a revision that works, then rollback to it. 

Also could you describe the issue that caused the rollout to fail to neptune team-lead?


*Git clone this repository to setup this lab and follow the below steps:*
```shell
git clone https://github.com/Gwenbleidd32/ckad-labs.git

cd ckad-labs

chmod +x rollout.sh

./rollout.sh
```

The answer to this question will be posted at a later date!

---

### Challenge Question 3
*No configuration script is required for this challenge.*

Team Pluto needs a new cluster internal service. Create a cluster IP Service named named `project-plt-6cc-svc` in Namespace `pluto`. 
This service should expose a single pod named `project-plt-6cc-api` of image `nginx:1.17.3-alpine`, create the pod as well. The pod should be identified by label `project:plt-6cc-api`. The Service should use tcp port redirection of `3333:80`

Finally use for example `curl` from a temporary `nginx:alpine` Pod to get the response from the service. Write the response into `/opt/service_test.html`. 
Also check if the logs of the Pod show the request and write those into /opt/service_test.log

---
### Challenge Question 4
Team Neptune has it's own `ServiceAccount` named `neptune-sa-v2` in Namespace `neptune`. A coworker needs the token from the secret that belongs to that *`ServiceAccount`* Write the base64 decoded token to file `/opt/token`


*Git clone this repository to setup this lab and follow the below steps:*
```shell
git clone https://github.com/Gwenbleidd32/ckad-labs.git

cd ckad-labs

chmod secret.sh

./secret.sh
```

---
### Challenge Question 5
*No configuration script is required for this challenge.*

Create a single Pod named `pod6` in Namespace `default` of image `busybox:1.31.0`. The Pod should have a readiness-probe executing `cat /tmp/ready`. It should initially wait 5 and periodically wait 10 seconds. This will set the container ready only if the file `/tmp/ready` exists.

The Pod should run the command `touch /tmp/ready && sleep 1d`, which will create the necessary file to be ready and then idles. Create the Pod and confirm it starts.

---

### Challenge Question 6
*No configuration script is required for this challenge.*

Create a single Pod of image `httpd:2.4.41-alpine` in namespace default.
The pod should be named `pod1` and the container should be named `pod1-container`. 

Your manager would like to run a command manually on occasion to output the *status* of that exact *Pod*. 

Please write a command that does this into a shell script at `/opt/pod1-status-command.sh`. 
The command should use `kubectl`

---

### Challenge Question 7
*No configuration script is required for this challenge.*

Team Neptune needs a Job template located a `/opt/job.yaml`. This Job should run image `busybox:1.31.0 and execute sleep 2 && echo done`. 
It should be in namespace `neptune`, run a total of 3 times and should execute 2 runs in parallel. 

Start the Job and check it's history. Each pod created by the Job should have the label  `id: awesome-job`. 
The job should be named `neb-new-job` and the container `neb-new-container`. 

---