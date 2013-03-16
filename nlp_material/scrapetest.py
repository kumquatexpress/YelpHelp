from bs4 import BeautifulSoup
import urllib2
from nltk.corpus import movie_reviews
import nltk
import pickle
import nltk.data
import re

def get_reviews():
    soup = BeautifulSoup(urllib2.urlopen('http://www.yelp.com/user_details?userid=93NGtlYTIghF8gKy2Dbb_Q').read())
    return [row.get_text() for row in soup('div', {'class': 'review_comment'})]

def get_words(reviews):
    all_words = []
    for (words, sent) in reviews:
        all_words.extend(words)
    return all_words

def get_word_features(wordlist):
    wordlist = nltk.FreqDist(wordlist)
    word_features = wordlist.keys()
    return word_features

def extract_features(review):
    review_words = set(review)
    features = {}
    for word in word_features:
        features[word] = (word in review_words)
    return features

reviews = get_reviews()

m_reviews = []
for fileid in movie_reviews.fileids():
    words = [e.lower() for e in movie_reviews.raw(fileid).split() if len(e) >= 3]
    m_reviews.append((words, fileid[0:3]))

word_features = get_word_features(get_words(m_reviews))

#features = extract_features(word_features, reviews[0])
#for feature in features.keys():
#    if features[feature] == True:
#        print feature

print "training_set"
training_set = nltk.classify.apply_features(extract_features, m_reviews)
print "classifier"
try:
    classifier = pickle.load(open("classifier.p", "rb"))
except:
    classifier = nltk.NaiveBayesClassifier.train(training_set)
    pickle.dump(classifier, open("classifier.p", "wb"))

for review in reviews:
    
    print "\n\nReview:\n"
    tokenizer = nltk.data.load('tokenizers/punkt/english.pickle')
    for sentence in tokenizer.tokenize(review):
        print classifier.classify(extract_features(sentence.split())), "\t", sentence
        print extract_features(sentence.split())
    print "\n\n"
