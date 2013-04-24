import json
from pprint import pprint

business_dict = {}
bid_dict = {}
user_dict = {}

#score_dict = {}

businesses_data = open('../nlp_material/jdata.json')
businesses = json.load(businesses_data)

# build helper dictionaries to speed up searches
def build_dicts(business_dict, bid_dict, user_dict):
    # a dictionary of all businesses by name
    for business in businesses :
        b_name = business["business"]["name"]
        business_dict[b_name] = business
        
        # a dictionary of all business names by id
        b_id = business["business"]["business_id"]
        bid_dict[b_id] = b_name
        
        reviews = business["reviews"]
        for review in reviews :
            reviewer = review["yelp_user_id"]
            
            # a dictionary of all reviews by user
            if reviewer in user_dict:
                user_dict[reviewer].append(review)
            else :
                user_dict[reviewer] = [review]


def build_user_dict():
    #users_data = open('yelp_users.json')
    users = json.load(businesses_data)

    user_dict = {}
    
    for user in users :
        user_dict[user["user_id"]] = user["reviews"]
        
    return user_dict
        
# Alongside the rating for each restaurant, we include an overall dependability score for all reviews submitted for that establishment. The score is calculated by examining each user who has submitted a review for that restaurant, comparing each of their ratings to the average rating of each establishment. The difference between the scores is summed up and divided by the number of reviews they have written. Then the average value is averaged again among all reviewers for this restaurant, giving the final score.


def credibility(business_name):
    reviews = business_dict["Viva La Diva Events"]["reviews"]
    
    review_sum = 0
    # for each user who reviewed the establishment
    for review in reviews :
        reviewer = review["yelp_user_id"]
    
        # retrieve all of their reviews
        user_reviews = user_dict[reviewer]
        
        user_review_sum = 0
        # for each of user's reviews
        for user_review in user_reviews:
        
            # compare the user's score with the average score
            business_id = user_review["business_id"]
            business_name = bid_dict[business_id]
            avg_rating = business_dict[business_name]["business"]["stars"]
            user_rating = user_review["stars"]
            r_diff = abs(user_rating - avg_rating)
            user_review_sum += r_diff
            
        review_sum += user_review_sum/len(user_reviews)
            
    return review_sum/len(reviews)