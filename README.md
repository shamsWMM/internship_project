# Internship Project: MPTCP, L4S, and PQC Setup
The experiment here is using Ubuntu 22.04 systems with Linux version 5.15.

## This repository contains the following components:
- PQC: Setting Up a Quantum-Safe Ubuntu
- MPTCP: Setting Up MPTCP on Ubuntu
- L4S: Setting Up L4S on Routers
- CloudLab: Creating the MPTCP-L4S-PQC Topology
- profile.py: A geni-lib Script for CloudLab

> Note: To use this repository as a CloudLab profile, a profile.py file is added here in the top-level directory of this repository. This will enable the instantiation of the repository-based profile on CloudLab.
> Instantiating a CloudLab profile using a repository leads to the cloning of the repository into the directory '/local/repository' on all nodes within the CloudLab experiment.












References:
- http://docs.cloudlab.us/geni-lib.html
- https://docs.cloudlab.us/creating-profiles.html
- https://github.com/emulab/my-profile/blob/master/profile.py
- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/getting-started-with-multipath-tcp_configuring-and-managing-networking
- https://github.com/aydini/Multipath-Wireless-Link-Traces.git
- https://witestlab.poly.edu/blog/emulating-multipath-wireless/
- https://witestlab.poly.edu/blog/mpcc-online-learning-multipath-congestion-control/
- https://medium.com/@iheb.zannina/setup-mptcpv1-in-linux-v5-6-9b5e48173b5b
