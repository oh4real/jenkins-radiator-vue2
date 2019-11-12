### Launch radiator and jenkins
1. Run `docker-compose up`
2. Watch streaming output and look for following section to copy the setup password

``` 
jenkins_1     | 
jenkins_1     | *************************************************************
jenkins_1     | *************************************************************
jenkins_1     | *************************************************************
jenkins_1     | 
jenkins_1     | Jenkins initial setup is required. An admin user has been created and a password generated.
jenkins_1     | Please use the following password to proceed to installation:
jenkins_1     | 
jenkins_1     | 6b7132ed8d9249d3b415c6895b845bed
jenkins_1     | 
jenkins_1     | This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
jenkins_1     | 
jenkins_1     | *************************************************************
jenkins_1     | *************************************************************
jenkins_1     | *************************************************************
jenkins_1     | 
jenkins_1     | 2019-11-11 23:25:48.711+0000 [id=41]    INFO    hudson.model.UpdateSite#updateData: Obtained the latest update center data file for UpdateSource default
```

### Provision and configure Jenkins
1. Log into jenkins at http://localhost:8333 and use setup password to provision Jenkins
2. Opt to **Select plugins to install** and then click **None** for a quick install.
3. After logging in, go to *Manage Jenkins::Configure Global Security* at http://localhost:8333/configureSecurity/ and toggle **Allow anonymous read access** so radiator can avoid having to be logged in.
4. From Jenkins home, add a couple Freestyle projects via ***New Item***.
5. From Jenkins home, add a couple of views via ***New View***, customize which jobs are displayed
6. Exec *Build Now* for the jobs a couple times.
5. Log out

### Explore Radiator
1. Navigate to http://localhost:8100
2. Select from the various views in the dropdown.
