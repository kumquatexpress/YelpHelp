import json

jdata = open('foodmap.json')
data = json.load(jdata)
print "read json file"

foods = {}
for food in data:
    bizset = set([biz for biz in data[food]])
    foods[food] = list(bizset)
jdata = json.JSONEncoder().encode(foods)
foodmap = open("foodmap.json", "w")
foodmap.write(jdata)
