# Setting Up MPTCP on Client and Server
>We are working on Ubuntu 22.04 running Linux 5.15. Our architecture consists of a server and a client, connected over two separate links.
Further details can be found by inspecting the profile.py file on the top-level directory of this repository.

Instantiate the profile as per the [instrcutions found on the CloudLab directory](../CloudLab/README.md).
You can use traceroute on the server and the client ensure the routing is working as planned. Results should be similar to the following:
On the server
```bash
traceroute 192.168.10.2
# traceroute to 192.168.10.2 (192.168.10.2), 30 hops max, 60 byte packets
# 1  router1-link-4 (192.168.3.2)  0.145 ms  0.142 ms  0.120 ms
# 2  emulator1-link-1 (192.168.1.1)  30.353 ms  30.333 ms  30.310 ms
# 3  client-link-0 (192.168.10.2)  30.499 ms  30.480 ms  30.460 ms
traceroute 192.168.20.2
# traceroute to 192.168.20.2 (192.168.20.2), 30 hops max, 60 byte packets
# 1  router2-link-5 (192.168.4.2)  0.162 ms  0.107 ms  0.075 ms
# 2  emulator2-link-3 (192.168.2.1)  30.363 ms  30.333 ms  30.306 ms
# 3  client-link-2 (192.168.20.2)  30.405 ms  30.375 ms  30.343 ms
```
On the client
```bash
traceroute 192.168.4.1
# traceroute to 192.168.4.1 (192.168.4.1), 30 hops max, 60 byte packets
# 1  emulator2-link-2 (192.168.20.1)  0.282 ms  0.288 ms  0.263 ms
# 2  router2-link-3 (192.168.2.2)  60.739 ms  60.717 ms  60.700 ms
# 3  server-link-5 (192.168.4.1)  60.848 ms  60.827 ms  60.803 ms
traceroute 192.168.3.1
# traceroute to 192.168.3.1 (192.168.3.1), 30 hops max, 60 byte packets
# 1  emulator1-link-0 (192.168.10.1)  0.267 ms  0.250 ms  0.231 ms
# 2  router1-link-1 (192.168.1.2)  60.699 ms  60.683 ms  60.666 ms
# 3  server-link-4 (192.168.3.1)  60.887 ms  60.872 ms  60.851 ms
```


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

