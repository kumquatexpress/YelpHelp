from bs4 import BeautifulSoup
import urllib2

#soup = BeautifulSoup(urllib2.urlopen('http://www.timeanddate.com/worldclock/astronomy.html?n=78').read())

#for row in soup('table', {'class' : 'spad'})[0].tbody('tr'):
#    tds = row('td')
#    print tds
#    print tds[0].string, tds[1].string

soup = BeautifulSoup(urllib2.urlopen('http://www.yelp.com/user_details?userid=93NGtlYTIghF8gKy2Dbb_Q').read())

print soup('div', {'class' : 'review_comment'})[1].get_text()

for  row in soup('div', {'class' : 'review_comment'}):
    print row.get_text()
#    div = row('div')
#    print div

#rows = [row for  row in soup('div', {'class' : 'review_comment'})]

#print rows

#for row in soup('div', {'class' : 'review_comment'}):
#    print row
