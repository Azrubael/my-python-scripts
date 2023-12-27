import requests
import json
from pyfiglet import Figlet


def ip2inf(ip):
    try:
        res = requests.get(url=f'http://ip-api.com/json/{ip}').json()
        # print(json.dumps(res, indent=2))
        data = {
                'IP': res.get('query'),
                'Internet provider': res.get('isp'),
                'Organization': res.get('org'),
                'Country': res.get('country'),
                'Region Name': res.get('regionName'),
                'City': res.get('city'),
                'ZIP': res.get('zip'),
                'Latitude': res.get('lat'),
                'Longitude': res.get('lon'),
        }
        for k, v in data.items():
            print(f'{k:18} : {v}')

    except requests.exceptions.ConnectionError:
        print('[!] Please check your connection!')


def main():
    preview = Figlet(font='slant')
    print(preview.renderText('INFO FROM IP'))
    default_ip = '24.48.0.1'
    print(f'The default IP is', default_ip)
    ip = input('Please enter a target IP: ')
    if ip == '':
        ip = default_ip
    ip2inf(ip)


if __name__ == '__main__':
    main()

