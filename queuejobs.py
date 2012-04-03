
import urllib
import ConfigParser
import datetime
import sys

config = ConfigParser.ConfigParser()
config.read('config.ini')

RUNTEST_URL = config.get('config', 'baseHost') + '/runtest.php'

commonParams = {
    'runs' : 10,
    'fvonly' : 0,
    'pingback' : 'http://localhost/runcomplete.php',
    'callback' : 'http://localhost/runcomplete.php' # old versions of wpt use callback instead of pingback
}

clients = ConfigParser.ConfigParser()
clients.read('clients.ini')

for client in clients.sections():
    for location in config.get('config', 'locations').split(','):
        location = location.strip()
        try:
            params = commonParams.copy()
            
            params.update({
                'label' : client + ' | no blocks',
                'url' : clients.get(client, 'url1'),
                'location' : location
            })
            print datetime.datetime.now(), client, urllib.urlencode(params)
            urllib.urlopen(RUNTEST_URL, urllib.urlencode(params))
            
            params.update({
                'label' : client + ' | with blocks',
                'block' : clients.get(client, 'block')
            })
            print datetime.datetime.now(), client, urllib.urlencode(params)
            urllib.urlopen(RUNTEST_URL, urllib.urlencode(params))
        except:
            print datetime.datetime.now(), client, sys.exc_info()[0]
