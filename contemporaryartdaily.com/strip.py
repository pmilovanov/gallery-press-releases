#!/usr/bin/python3

# Given index.html as $1, extract text between "Press Release:" and "Link:"
# If either of these is not found, abort.
# Also remove HTML5 entities and normalize whitespace.

# Example usage from shell:
#    find www.contemporaryartdaily.com -name index.html | xargs -I {} ./strip.py {} >> alltext.txt

import sys, re

fname = sys.argv[1]

raw = ""

with open(fname, "r") as f:
    raw = f.read()

s1str = "<em>Press Release:</em>"
s2str = "<em>Link:"
s1, s2 = 0, 0
if s1str not in raw or s2str not in raw:
    exit()
    
s1 = raw.index(s1str) + len(s1str)
s2 = raw.index(s2str)

pr0 = raw[s1:s2]
pr1 = re.sub("(<[^>]*>)|(&[#0-9]*;)", "", pr0)
pr2 = re.sub("~~~", "\n", re.sub("\s+", " ", re.sub("\n", "~~~", pr1)))

print(pr2)
