Front-End
In DataApp/static
	index.html - Main document.
	style.css - Main styles.
	mapping.js - Handles front-end mapping.
	searching.js - Handles making ajax calls to back-end, searching for restaurants.
	listening.js - Sets up all listeners on the various UI objects.
	ui.js - Collection of functions for manipulating common aspects of the UI

Back End
DataApp - a rails app, most of the files aren’t useful and won’t be described here
In DataApp/models:
	business.rb - object mapping for the businesses table
	yelp_user.rb - object mapping for the users table
	review-rb - object mapping for the reviews table
	neighborhood.rb - weak join entity between businesses and neighborhoods
	category.rb - weak join entity between businesses and categories
	vote.rb - object mapping for user votes on reviews
	school.rb - weak join entity between businesses and schools
food_item.rb - object mapping for the food table which maps food names to businesses that serve positively reviewed foods
In DataApp/controllers:
	businesses_controller - router that provides most of the api to retrieve business ids in json format
	reviews_controller - router providing the api services to retrieve reviews linked to businesses
In DataApp/helpers:
HelperMethods.rb - a bunch of static methods that are used in importing/rating certain businesses, mostly in processing data
database.yml - database connection info
db/migrate - rails version of DDL and table creation/modification


NLP

In nlp_materials/:
	classifier.p - a sentiment classifier based on movie reviews: turns out it doesn’t work well with food. Data stored in python pickle format.
	clean_map.py - removes duplicate entries in foodmap.json
	food_mapper.py - creates json file foodmap.json that links foods to business_ids of those restaurants whose reviews were positive for the particular food
	foods.txt - list of foods mentioned in reviews
	get_foods.py - gets a list of nouns from the reviews that might be foods
	get_opinions - finds sentiment-indicative vocabular in reviews
	jdata.json - reviews
	jjs.txt - sentiment vocabulary items, unsorted
	negative.txt - negative vocabulary items
	positive.txt - positive vocabulary items
