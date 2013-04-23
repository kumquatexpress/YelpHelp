import json
import urllib2
from pprint import pprint
import nltk

#jdata = urllib2.urlopen('http://174.129.210.6/reviews/all_by_business/100.json').read()
#print jdata


jdata = open('jdata.json')
data = json.load(jdata)
#pprint(data)

jjs = set([])
for biz in data:
    for review in biz["reviews"]:
        text = review["text"]
        tokenized = nltk.word_tokenize(text.lower().strip())
        tagged = nltk.pos_tag(tokenized)
        for pair in tagged:
            if pair[-1] == "JJ":
                jjs.add(pair[0])
for word in jjs:
    try:
        print word
    except:
        pass

#        print review["text"]
#print data[0]["reviews"][0]["text"]
#for reviews in data:
#    print reviews["business"]["city"]
