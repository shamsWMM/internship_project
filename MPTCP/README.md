# Setting Up MPTCP on Client and Server
We are working on Ubuntu 22.04 running Linux 5.15. To verify MPTCP is enabled, enter the following:

Our architecture consists of a server and a client, connected over two separate links.

### Check configuration on the server and the client
```bash
# Verify MPTCP is enabled
sudo sysctl net.mptcp.enabled
# output: net.mptcp.enabled = 1

# Show current configuration
ip mptcp limit show
```
