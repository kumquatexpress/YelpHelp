import json
import urllib2
from pprint import pprint
import nltk

posfile = open("positive.txt", "ru")
pos = set([word.strip() for word in posfile])
print "got positive words"
negfile = open("negative.txt", "ru")
neg = set([word.strip() for word in negfile])
print "got negative words"

foodfile = open("foods.txt", "ru")
foods = {}
foodnames = {}
for food in foodfile:
    food = food.strip().split("\t")
    if len(food) == 1:
        foodnames[food[0]] = food[0]
    else:
        foodnames[food[0]] = food[1]
foods = { foodnames[food] : [] for food in foodnames.keys() }
print "got list of foods"

print "processing..."

for index in range(0,20):
    jfile = 'http://174.129.210.6/reviews/close_to_philly/' + str((index)*100) + '/'+str((index+1)*100)+'.json'
    try:
        jdatafile = urllib2.urlopen(jfile).read()
    except:
        print "couldn't read"
        try:
            jdatafile = urllib2.urlopen(jfile).read()
        except:
            print "still couldn't read. giving up"
            break
    print jfile

    jdata = open('jdata.json',"w")
    jdata.write(jdatafile)
    jdata.close()
    jdata = open('jdata.json')
    data = json.load(jdata)
    print "read json file"

    for biz in data:
        id =  biz["business"]["business_id"]
        for review in biz["reviews"]:
            text = review["text"]
            tokenized = nltk.word_tokenize(text.lower().strip())
            sentiment = 0
            for token in tokenized:
                if token in pos:
                    sentiment += 1
                elif token in neg:
                    sentiment -= 1
            if sentiment >= 0:
                for token in tokenized:
                    if token in foodnames.keys():
                        foods[foodnames[token]].append(id)

jdata = json.JSONEncoder().encode(foods)
foodmap = open("foodmap.json", "w")
foodmap.write(jdata)

