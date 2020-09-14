#!/usr/bin/python3
"""DataAPI module"""
import requests
import sys


if __name__ == '__main__':
    empl_id = sys.argv[1]
    r1 = requests.get('https://jsonplaceholder.typicode.com/users/{}'.
                     format(empl_id))
    empl_name = r1.json()['name']
    r2 = requests.get('https://jsonplaceholder.typicode.com/todos?userId={}'.
                     format(empl_id))
    responses = r2.json() 
    done_tasks = [t for t in responses if t.get('completed')]
    print('Employee {} is done with tasks({}/{}):'.
          format(empl_name, len(done_tasks), len(responses)))
    for t in done_tasks:
        print('\t{}'.format(t.get('title')))
