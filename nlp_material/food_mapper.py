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
foods = { food.strip() : [] for food in foodfile }
print "got list of foods"

print "processing..."

for index in range(0,20):
    try:
        jfile = 'http://174.129.210.6/reviews/all_by_business/' + str((index)*300) + '/'+str((index+1)*300)+'.json'
    except:
        print "couldn't read"
        try:
            jfile = 'http://174.129.210.6/reviews/all_by_business/' + str((index)*300) + '/'+str((index+1)*300)+'.json'
        except:
            print "still couldn't read. giving up"
    print jfile
    jdatafile = urllib2.urlopen(jfile).read()
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
                    if token in foods.keys():
                        foods[token].append(id)

jdata = json.JSONEncoder().encode(foods)
foodmap = open("foodmap.json", "w")
foodmap.write(jdata)

