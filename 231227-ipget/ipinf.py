import requests
import json
import folium
import os
from pyfiglet import Figlet
from datetime import datetime


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
        
        ms = round(datetime.now().timestamp() * 1e4)
        full_path = check_dir('OUTPUT') + \
                f"{res.get('query')}_{res.get('city')}_{ms}.html"
        area = folium.Map(location=[res.get('lat'), res.get('lon')])
        area.save(full_path)
        print('\nA file is saved in a directory:\n', full_path)

    except requests.exceptions.ConnectionError:
        print('[!] Please check your connection!')


def check_dir(path):
    full_path = os.getcwd() + f'/{path}/'
    if not os.path.exists(full_path):
        try:
            os.makedirs(path)
        except:
            print('Error of creating a directory:', full_path)
    return full_path


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

