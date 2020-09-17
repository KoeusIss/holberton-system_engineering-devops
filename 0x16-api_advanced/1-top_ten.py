#!/usr/bin/python3
"""AdvancedAPI"""
import requests


def top_ten(subreddit):
    """Returns the top 10 hotest posts for a given subreddit"""
    base_url = 'https://www.reddit.com'
    query = 'r/{}/hot.json?limit=10'.format(subreddit)
    headers = {
        "User-Agent": "linux:hbtn.advanced.api (by /u/koeusiss)"
    }
    req = requests.get(
        url='{}/{}'.format(base_url, query),
        headers=headers,
        allow_redirects=False
    )
    if req.status_code == 404:
        print('None')
    res = req.json().get('data').get('children')
    for children in res:
        print(children.get('data').get('title'))
