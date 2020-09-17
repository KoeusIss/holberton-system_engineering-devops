#!/usr/bin/python3
"""AdvancedAPI"""
import requests


def recurse(subreddit, hot_list=[], after="", count=0):
    """Returns the hotest title recursivly"""
    base_url = 'https://www.reddit.com'
    query = 'r/{}/hot.json'.format(subreddit)
    headers = {
        "User-Agent": "linux:hbtn.advanced.api (by /u/koeusiss)"
    }
    params = {
        "after": after,
        "count": count
    }
    req = requests.get(
        url='{}/{}'.format(base_url, query),
        headers=headers,
        params=params,
        allow_redirects=False
    )
    if req.status_code == 404:
        return None
    res = req.json().get('data')
    after = res.get('after')
    count += res.get('dist')
    children = res.get('children')
    for child in children:
        hot_list.append(child.get('data').get('title'))
    if after:
        return recurse(subreddit, hot_list, after, count)
    return hot_list
