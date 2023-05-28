*********************
  2023-05-28  16:31
*********************
#  Install the Google Cloud CLI n Ubuntu

This quickstart guides you through installing and initializing the Google Cloud CLI and running a few core gcloud CLI commands.

		To follow step-by-step guidance for this task directly in the Google Cloud console, click Guide me:
https://console.cloud.google.com/?walkthrough_id=sdk--cloud-cli-quickstart&_ga=2.157140667.1026224547.1680633002-728731538.1680633002


*Before you begin*
Sign in to your Google Cloud account. If you're new to Google Cloud, create an account to evaluate how our products perform in real-world scenarios. New customers also get $300 in free credits to run, test, and deploy workloads.
In the Google Cloud console, on the project selector page, select or create a *Google Cloud project*.
Make sure that billing is enabled for your Cloud project. Learn how to check if billing is enabled on a project.

*Installing the latest gcloud CLI version (425.0.0)*
Package contents
The gcloud CLI is available in package format for installation on Debian and Ubuntu systems. This package contains the gcloud, gcloud alpha, gcloud beta, gsutil, and bq commands only. It doesn't include kubectl or the App Engine extensions required to deploy an application using gcloud commands. If you want these components, you must install them separately:
https://cloud.google.com/sdk/docs/install-sdk#deb-additional

*Before begin*
Before you install the gcloud CLI, make sure that your operating system meets the following requirements:
- An Ubuntu release that hasn't reached end-of-life or a Debian stable release that hasn't reached end-of-life
- apt-transport-https is installed:
	$ sudo apt-get install apt-transport-https ca-certificates gnupg
	
=====================================================================	
## Installation
###(1) Add the gcloud CLI distribution URI as a package source. 
~~~If your distribution supports the signed-by option, run the following command:
	$ echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list~~~
	
If your distribution doesn't support the signed-by option, run the following command:
	$ echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	
*NOTE* Make sure you don't have duplicate entries for the cloud-sdk repo in
/etc/apt/sources.list.d/google-cloud-sdk.list.

If your distribution (Debian 11+ or Ubuntu 21.10+) doesn't support apt-key, run the following command:
	$ curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

###(2) Import the Google Cloud public key.	
If you can't get latest updates due to an expired key, obtain the latest apt-get.gpg key file.
https://cloud.google.com/compute/docs/troubleshooting/known-issues#keyexpired

###(3) Update and install the gcloud CLI:
	$ sudo apt-get update && sudo apt-get install google-cloud-cli
If apt-key command is not supported:
	$ RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-sdk -y

###(4) (Optional) Install any of the following additional components:
https://cloud.google.com/sdk/docs/components#additional_components
	$ snap install google-cloud-cli --classic
google-cloud-cli 425.0.0 from Cloud SDK (google-cloud-sdk✓) installed

###(5) 
	$ gcloud init
OR
	$ gcloud init --console-only
	 To prevent the command from launching a web browser
	 [4/0AVHEtk5jIef9DG6XRet4WYigtdy1BpJwyuixgHQ_QgXKcue06DnMo97p_FKe_yDFK7mggQ]
OR
[To authorize without a web browser and non-interactively, create a service account with the appropriate scopes using the Google Cloud console and use]	
	$ gcloud auth activate-service-account
[with the corresponding JSON key file]
