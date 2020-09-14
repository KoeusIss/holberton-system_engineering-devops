#!/usr/bin/python3
# Exports tasks to csv
import csv
import requests
import sys


if __name__ == '__main__':
    empl_id = sys.argv[1]
    r1 = requests.get('https://jsonplaceholder.typicode.com/users/{}'.
                     format(empl_id))
    empl_username = r1.json().get('username')
    r2 = requests.get('https://jsonplaceholder.typicode.com/todos?userId={}'.
                     format(empl_id))
    responses = r2.json() 
    with open('{}.csv'.format(empl_id), 'w') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        for task in responses:
            writer.writerow([
                empl_id,
                empl_username,
                task.get('completed'),
                task.get('title')
            ])
