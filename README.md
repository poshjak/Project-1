# Project-1
The diagram below represents the network configured from files in this repository.
![Cloud-Security-Diagram](https://user-images.githubusercontent.com/87518665/143980067-67ec0678-175b-40ad-92cb-7aa4a36f0950.png)

The files in this repository have been tested and used to create an ELK deployment on Azure. As shown above they can be used to recreate the entire deployment. On the other hand, some sections of the playbook (.yml) file(s) can be used to install only certain parts of it, for example; Filebeat. 

#### The ansible playbooks below were needed to configure both the DVWA containers and the Elk server:

[my-playbook.yml](https://github.com/poshjak/Project-1/blob/e54a24244896511e4c096c657c19565d9580b705/Ansible/my-playbook.yml): Install DVWA containers

[elk-playbook.yml](https://github.com/poshjak/Project-1/blob/e54a24244896511e4c096c657c19565d9580b705/Ansible/elk-playbook.yml): Install ELK server

[filebeat-playbook.yml](https://github.com/poshjak/Project-1/blob/e54a24244896511e4c096c657c19565d9580b705/Ansible/filebeat-playbook.yml): Install and configure filebeat on ELK server and DVWA containers

[metricbeat-playbook.yml](https://github.com/poshjak/Project-1/blob/e54a24244896511e4c096c657c19565d9580b705/Ansible/Metricbeat-playbook.yml): Install and configure metricbeat on ELK server and DVWA containers


#### This document contains the following details:

-> Description of the Topology

-> Access Policies

-> ELK Configuration

-> Beats in Use

-> Machines Being Monitored

-> How to Use the Ansible Build

## Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
* Load balancing helps to protect servers from a DDoS attack as it distributes the service loads across the system, for example the load is distributed across multiple VMs within the system environment

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

* Filebeat watches for log files/locations and collect log events. (Filebeat: Lightweight Log Analysis & Elasticsearch)
* Metricbeat records metrics and statistical data from the operating system and from services running on the server (Metricbeat: Lightweight Shipper for Metrics)

Configuration details for each machine are detailed below:


 **Name** | **Function** | **IP Address** | **Operating system**
 --- | --- | --- | --- 
 Jump-Box | Gateway | 10.0.0.4 | Linux (Ubuntu 18.04 LTS) 
 Web-1 | Web server | 10.0.0.5 | Linux (Ubuntu 18.04 LTS) 
 Web-2 | Web server | 10.0.0.6 | Linux (Ubuntu 18.04 LTS) 
 Web-3 | Web server | 10.0.0.7 | Linux (Ubuntu 18.04 LTS) 
 ELK-Server | ELK Stack | 10.1.0.4 | Linux (Ubuntu 18.04 LTS) 

## Access policies

The machines on the internal network are not exposed to the public Internet.

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

* Personal IP Address

Machines within the network can only be accessed by SSH.

* The ELK-Server is only accessible by SSH from the JumpBox and via web access from Personal IP Address.

Detailed access policies for each machine can be found below

**Name** | **Publicly Accessible** | **Allowed IP Addresses** 
--- | --- | --- 
Jump-Box | No | Personal IP address (dynamic)
Web-1 | Yes (through load balancer) | 10.0.0.4 (Jump-Box) SSH
Web-2 | Yes (through load balancer) | 10.0.0.4 (Jump-Box) SSH
Web-3 | Yes (through load balancer) | 10.0.0.4 (Jump-Box) SSH
ELK-server | No | 10.0.0.4 (Jump-Box) SSH

## ELK configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
* Automation allows you to easily configure and deploy multiple servers without having to go in and physically configure each one

The playbook implements the following tasks:

1. Install Docker.io and pip3
2. Increases VM memory
3. Download and configure ELK docker container
4. Sets published ports

The screenshot below shows the result of running the command *sudo docker ps* after configuring the ELK container

![Screenshot (27)](https://user-images.githubusercontent.com/87518665/143987571-cb62a51a-6b98-4373-8295-659c875515df.png)

## Target Machines and Beats

This ELK server is configured to monitor the following machines:
* Web-1 (10.0.0.5)
* Web-2 (10.0.0.6)
* Web-3 (10.0.0.7)

The following beats have been installed on these servers:
* Filebeat
* Metricbeat

These beats allow you to do the following on each server:
* Filebeat watches for the log files/locations and collect log events. (Filebeat: Lightweight Log Analysis & Elasticsearch)
* Metricbeat records metrics and statistical data from the operating system and from services running on the server (Metricbeat: Lightweight Shipper for Metrics)

## Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

* Copy the filebeat-config.yml and metricbeat-config.yml files to /etc/ansible/files
* Update the configuration files to include the Private IP of the ELK-Server to the ElasticSearch and Kibana Sections of the Configuration File
* Run the playbook, and navigate to ELK-Server-PublicIP:5601/app/kibana to check that the installation worked as expected.

## Commands needed to run the Ansible Configuration for the ELK-server:

1. ssh azadmin@(JumpBoxIPaddress)
2. sudo docker container list -a --> Reveal the ansible container
3. sudo docker start (container_name)
4. sudo docker attach (container-name)
5. cd /etc/ansible
6. ansible-playbook elk-playbbook.yml (Installs and configures ELK-server)
7. cd /etc/ansible
8. ansible playbook filebeat-playbook.yml (Installs and configures filebeat)
9. ansible playbook metricbeat-playbook.yml (Installs and configures metricbeat)
10. Open new browser, navigate to ELK-Server-PublicIP:5601/app/kibana) --> This brings up the Kibana home page

![Screenshot (29)](https://user-images.githubusercontent.com/87518665/143988851-bbe04fe7-699b-411b-bd1c-9db7ce2f154d.png)
