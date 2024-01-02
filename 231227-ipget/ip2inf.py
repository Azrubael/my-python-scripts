import requests
import json

# Get detailed information about a host by its IP


def ip2inf(ip):
    try:
        res = requests.get(url=f'http://ip-api.com/json/{ip}').json()
        print(json.dumps(res, indent=2))
    except requests.exceptions.ConnectionError:
        print('[!] Please check your connection!')


def main():
    default_ip = '24.48.0.1'
    print(f'The default IP is', default_ip)
    ip = input('Please enter a target IP: ')
    if ip == '':
        ip = default_ip
    ip2inf(ip)


if __name__ == '__main__':
    main()

