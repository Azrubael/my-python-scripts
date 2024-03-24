import psutil
import platform

"""
A Python3 script that it makes association with running services and process in Windows
"""


# Check if the operating system is Windows
if platform.system() != 'Windows':
    print("This script is intended for Windows operating system only.")
else:
    # Get list of running services
    services = []
    for service in psutil.win_service_iter():
        services.append(service.as_dict())

    # Get list of running processes
    processes = []
    for proc in psutil.process_iter(['pid', 'name']):
        processes.append(proc.info)

    # Create a hash table to store the association
    association = {}
    for service in services:
        association[service['name']] = [proc['name'] for proc in processes if proc['pid'] in service['pid']]

    # Print the association hash table
    print(association)