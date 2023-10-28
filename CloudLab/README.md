# CloudLab Instructions

## 1.1  Creating the Topology
1. Log in to your CloudLab account.
2. Navigate to Experiments > Create Experiment Profile.
3. Create a name for the profile such as "[internship_project]"(https://www.cloudlab.us/p/mptcpl4spqc/internship_project).
4. Select Git Repo and copy and paste the link for [this repository](https://github.com/shamsWMM/internship_project.git).
5. Click Confirm then click Create.

# 1.2 Instantiating the profile
1. Click instantiate on the profile page created in section [1.1 above](#11-Creating-a-basic-profile).
2. Select Cloudlab Wisconson from the Cluster dropdown menu, then click next.
3. Click Finish. 

# 1.3 Implementing Updates from the GitHub Repository
1. Navigate to CloudLab main page.
2. From Experiments > My Profiles click on the project profile.
3. Click Edit under Repository Info.
4. Click Update next to the Repository link.
   Upon a successful update, a preview of the last log made on the repository will be shown under Repository Info.

# 1.4 Running Startup Scripts on Nodes
To run a startup script on the node upon instatiating the topoloyg: 
1. Check the [CloudLab directory](.) for an existing .sh file for the node of interest.
2.a If the .sh file exists for the node (e.g. client.sh, emulator1.sh, etc.): edit the startup file then go to step 5.
2.b If the .sh file does not exist: Create a .sh file with the appropriate name (e.g. client.sh) and save the file in the [CloudLab directory](.).
4. Navigate to [profile.py](../profile.py) on the top-level directory and uncomment the line containing the "addService" method for the corresponding node.
5. Commit all changes then follow the instructions in section [1.3 above](#13-Implementing-Updates-from-the-GitHub-Repository) to update the profile.
6. Instantiate the updated profile.
