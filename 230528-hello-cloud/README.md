`In order to enable hello_cloud.py to run on boot, copy the file hello_cloud.py to the /usr/local/bin/ location.`
[1] - $ sudo cp hello_cloud.py /usr/local/bin/

`Also copy hello_cloud.service to the /etc/systemd/system/ location.`
[2] - $ sudo cp hello_cloud.service /etc/systemd/system

`Now, use the systemctl command to enable the service hello_cloud.`
[3] - $ sudo systemctl enable hello_cloud.service

`Restart VM`
[4] - $ sudo reboot
OR  - $ sudo shutdown -r +10		// after 10min 

[5] - Use `http://EXTERNAL-IP.`
`An exaple`
    vm1:		http://34.73.110.185
    Hello Cloud
    Histname: vm1
    IP Address: 10.142.0.2

    
# To create new VM instances with the template
`Go to the command line interface on a local computer, and enter the following command`:
[6.1]    $ gcloud compute instances create --zone us-west1-b --source-instance-template vm1-template vm2 vm3 vm4 vm5 vm6 vm7 vm8

`Wait for the command to finish. Once it's done, you can view the instances through the Console or by using the following gcloud command on your local terminal`:
[6.2]    $ gcloud compute instances list

[6.3]    Open the external links for vm2 and vm8 to check if all the configuration set up properly as vm1:
    Hello Cloud
    Histname: vm2
    IP Address: 10.138.0.7

    Hello Cloud
    Histname: vm8
    IP Address: 10.138.0.5
    
    
###Examples of a result
    ~$ gcloud compute instances create --zone us-west1-b --source-instance-template vm1-template vm2 vm3 vm4 vm5 vm6 vm7 vm8
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm2].
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm3].
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm4].
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm5].
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm6].
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm7].
Created [https://www.googleapis.com/compute/v1/projects/gcp-02-35a8cff83dbf/zones/us-west1-b/instances/vm8].
NAME  ZONE        MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
vm2   us-west1-b  n1-standard-1               10.138.0.7   35.197.83.90   RUNNING
vm3   us-west1-b  n1-standard-1               10.138.0.8   34.83.180.24   RUNNING
vm4   us-west1-b  n1-standard-1               10.138.0.6   35.247.83.234  RUNNING
vm5   us-west1-b  n1-standard-1               10.138.0.3   34.168.239.19  RUNNING
vm6   us-west1-b  n1-standard-1               10.138.0.2   35.233.152.74  RUNNING
vm7   us-west1-b  n1-standard-1               10.138.0.4   35.230.70.75   RUNNING
vm8   us-west1-b  n1-standard-1               10.138.0.5   34.83.127.22   RUNNING


### netstat installation and using
    $ sudo apt update                   # get updated repo info
    $ sudo apt install net-tools        # install net-tools
    $ netstat -ntulpe                   # test it
    $ sudo netstat -nlp | grep :80      # to check a port :80
