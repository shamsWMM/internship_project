# Setting Up MPTCP on Client and Server
>We are working on Ubuntu 22.04 running Linux 5.15.

>Our architecture consists of a server and a client, connected over two separate links.
Further details can be found by inspecting the profile.py file on the top-level directory of this repository.

Instantiate the profile as per the instrcutions found on [README.md in CloudLab](../CloudLab/README.md).
> You can ping the server from the client and vice versa to either interface of each node to be confident in the links.



#### Check the configuration on the server and the client
```bash
# Verify MPTCP is enabled
sudo sysctl net.mptcp.enabled
# output: net.mptcp.enabled = 1

# Show current configuration
ip mptcp limit show
```
### Server Configuration
```bash
# Add one more subflow to 
```

