### CKAD Challenge Question 1

The board of team Neptune decided to take over control of a server running in the `default` namespace.

The admin who once setup this webserver is not part of the organization any longer. All the information you could get was that the application contains a system called `parser`. 

Search for the application containing the parser system and migrate it into the `neptune` namespace.

Navigate here to open a free CKAD lab enviornment to work on this challenge:
- https://killercoda.com/

Git clone this repository to setup this lab and follow the below steps:
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

Git clone this repository to setup this lab and follow the below steps:
```shell
git clone https://github.com/Gwenbleidd32/ckad-labs.git

cd ckad-labs

chmod +x rollout.sh

./rollout.sh
```

The answer to this question will be posted at a later date!

---

