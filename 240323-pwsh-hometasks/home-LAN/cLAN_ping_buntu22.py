import ipaddress
import subprocess
import concurrent.futures


network = ipaddress.IPv4Network('192.168.1.0/24')


def ping(ip):
    try:
        result = subprocess.run(['ping', '-c', '1', str(ip)], capture_output=True, text=True, timeout=2)
        if result.returncode == 0:
            return (ip, "is up")
        else:
            return (ip, "is down")
    except subprocess.TimeoutExpired:
        return (ip, "is down")

results = None
with concurrent.futures.ThreadPoolExecutor(max_workers=25) as executor:
    results = list(executor.map(ping, network.hosts()))
    for result in results:
        if result[1] == "is up": print(result[0], result[1])

