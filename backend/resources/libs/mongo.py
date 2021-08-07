from pymongo import MongoClient

client = MongoClient('mongodb+srv://qaninja:academy@cluster0.xhw0i.mongodb.net/rocklove?retryWrites=true&w=majority')
db = client['rocklove']

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})
