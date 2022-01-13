## Usages
```
docker build -t php-cake:0.1 .
docker stack deploy --compose-file docker-compose.yaml stackdemo
docker exec mysql mysql -uroot -p myapp < backup.sql 
docker stack rm stackdemo
```
## Docker Version Management 

Along with every build in Jenkins or any other CI/CD tool we'll be having build number and we can utilize that to separate artifact in image registry

## Image version number

Versioning of the number could be depend on the requirement basis, Below I've categorised this in the section to increment the numbering of an artifact

Major  v1.0.0
Minor  v1.1.0
Patch  v1.0.1

## Front End Assests

If we're talking about the images we can store in the object storage like s3 in AWS, blob storage in Azure and we can serve those using CDN geographically which improve user experience by fasting the delivery of the content.

## Stages of delivery

Stages could be depend on the company to company implementation but majorly I've experienced with having 4 stages.

DEV, QA, STAGE, PROD

In first stage we'll be building and deploying our code and running some automated tests, and later on QA stage Quality Assrance team ensure the functional and integrity testing and third stage is pre-prod where we'll be deploying application to get some feedback before going to live and fourth stage is where we're finally deploying application for user experience.

## Docker and its stages

We can version our images on-behalf of branching model we're using to develop our application. Most famous branching model is Git-Flow in which we'll be having 2 branches one is develop and other is RC. When we're pusing code to develop we'll be giving name something like myapp:dev-0.1 and when application pushed to RC it should be having naming convention like myapp:rc-0.1

Initially code should be pushed to developer brach like feature, testing etc. when it has been reviewed by other team member then it should be pushed to develop and later on to RC branch for the release. So, in this process it'll be going through the above environments I've explained above.

## CI/CD

So, for this project we'll be having tools like Jenkins to process code and generate artifact, SonarQube (Code Analysis), Artifactory for storing artifacts (Jfrog, Nexus), Image registry Public(Dockerhub), Private (Nexus, Jfrog, gitlab) 
