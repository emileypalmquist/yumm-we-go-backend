user_1 = User.create(first_name: 'Emiley', last_name: 'Palmer', username: 'emileypalmer', email: 'emiley.palmquist@fakemail.com', password_digest: 'helloworld', birthday: '1990-12-20')

user_2 = User.create(first_name: 'Kailey', last_name: 'Pow', username: 'kaileypow', email: 'kailey.pow@fakemail.com', password_digest: 'helloworld', birthday: '1999-05-20')

user_3 = User.create(first_name: 'Carisa', last_name: 'Pow', username: 'carisapow', email: 'carisa.pow@fakemail.com', password_digest: 'helloworld', birthday: '1999-05-20')

user_4 = User.create(first_name: 'Justin', last_name: 'Palmer', username: 'justinpalmer', email: 'justin.palmer@fakemail.com', password_digest: 'helloworld', birthday: '1993-03-20')

user_5 = User.create(first_name: 'Ayva', last_name: 'Fos', username: 'ayvafos', email: 'ayva.fos@fakemail.com', password_digest: 'helloworld', birthday: '2010-02-07')

friend_1 = Friend.create(friend_a_id: 1, friend_b_id: 3)
friend_2 = Friend.create(friend_a_id: 1, friend_b_id: 2)
friend_3 = Friend.create(friend_a_id: 1, friend_b_id: 4)
friend_4 = Friend.create(friend_a_id: 1, friend_b_id: 5)
friend_5 = Friend.create(friend_a_id: 3, friend_b_id: 2)
friend_6 = Friend.create(friend_a_id: 3, friend_b_id: 5)
friend_7 = Friend.create(friend_a_id: 3, friend_b_id: 4)
friend_8 = Friend.create(friend_a_id: 4, friend_b_id: 5)
friend_9 = Friend.create(friend_a_id: 4, friend_b_id: 2)
friend_10 = Friend.create(friend_a_id: 5, friend_b_id: 2)

mood_1 = Mood.create(name: 'happy', user_id: 1)
mood_2 = Mood.create(name: 'happy', user_id: 2)
mood_3 = Mood.create(name: 'happy', user_id: 3)
mood_4 = Mood.create(name: 'happy', user_id: 1)
mood_5 = Mood.create(name: 'happy', user_id: 1)

category_1 = Category.create(name: 'mexican', user_id: 1)
category_2 = Category.create(name: 'mexican', user_id: 1)
category_3 = Category.create(name: 'mexican', user_id: 1)
category_4 = Category.create(name: 'mexican', user_id: 1)
category_5 = Category.create(name: 'mexican', user_id: 1)
category_6 = Category.create(name: 'japanese', user_id: 1)
