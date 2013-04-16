import json
import urllib2
from pprint import pprint
import nltk

jdata = urllib2.urlopen('http://174.129.210.6/reviews/all_by_business/100.json').read()
#print jdata


jdata = open('jdata.json')
data = json.load(jdata)
#pprint(data)

foodfile = open("foods.txt", "ru")
foods = { food.strip() : [] for food in foodfile }

for biz in data:
    id =  biz["business"]["business_id"]
    for review in biz["reviews"]:
        text = review["text"]
        tokenized = nltk.word_tokenize(text.lower().strip())
        for token in tokenized:
            if token in foods.keys():
                foods[token].append(id)
jdata = json.JSONEncoder().encode(foods)
print jdata

