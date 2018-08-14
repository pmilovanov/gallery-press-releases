#!/usr/bin/python3

from bs4 import BeautifulSoup
import sys
import os.path

filename = sys.argv[1]
if not os.path.isfile(filename):
    print("Bad filename:", filename)
    sys.exit()

html = ''
with open(filename, 'r') as f:
    html = f.read()

bs = BeautifulSoup(html, 'html.parser')


e = bs.find(class_="article-content").find(class_="wrap-block-text")

text = e.text

output = ""
for line in text.split('\n'):
    if len(line.strip()) > 50 and '@' not in line:
        output += line + '\n'
    
print(output)
