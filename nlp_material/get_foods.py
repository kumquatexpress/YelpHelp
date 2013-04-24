import json
import urllib2
from pprint import pprint
import nltk

nns = set([])
for index in range(0, 100):
    print index
    try:
        jdatafile = urllib2.urlopen('http://174.129.210.6/reviews/close_to_philly/'+str(index*100)+'/'+str((index+1)*100)+'.json').read()
    except:
        print "quitting"
        break

#print jdata


#jdata = open('jdata.json')
    jdata = open('jdata.json',"w")
    jdata.write(jdatafile)
    jdata.close()
    jdata = open('jdata.json')
    data = json.load(jdata)
    print "read json file"
#pprint(data)


    for biz in data:
        for review in biz["reviews"]:
            text = review["text"]
            tokenized = nltk.word_tokenize(text.lower().strip())
            tagged = nltk.pos_tag(tokenized)
            for pair in tagged:
                if pair[-1] == "NN":
                    nns.add(pair[0])

f = open("raw_foods.txta","w")
for word in nns:
    try:
        print word
        f.write(word + "\n")
    except:
        pass

#        print review["text"]
#print data[0]["reviews"][0]["text"]
#for reviews in data:
#    print reviews["business"]["city"]
