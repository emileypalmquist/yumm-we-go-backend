class User < ApplicationRecord
  has_secure_password

  has_many :restaurants
  has_many :moods
  has_many :categories
  
  has_many :friend_a_friends, foreign_key: :friend_b_id, class_name: 'Friend'
  has_many :friend_as, through: :friend_a_friends, source: :friend_a
  has_many :friends_b_friends, foreign_key: :friend_a_id, class_name: 'Friend'
  has_many :friend_bs, through: :friends_b_friends, source: :friend_b
 

  validates :username, uniqueness: { case_sensitive: false }

  def recommended_friends
    friends = self.friend_as.concat(self.friend_bs).uniq
    if friends.length > 0
      friends_friends = friends.map{|friend| friend.friend_as.concat(friend.friend_bs)}[0].uniq
      return recommended_friends = friends_friends.filter{|friend| friend.id != self.id}
    else
      other_users = User.all.filter{|user| user.id != self.id}
      return possible_friends = other_users.reject {|u| friends.include? u}
    end
   
  end

  def friends
    return friends = self.friend_as.concat(self.friend_bs).uniq
  end

  def find_friends
    friends = self.friend_as.concat(self.friend_bs).uniq
    other_users = User.all.filter{|user| user.id != self.id}
    return possible_friends = other_users.reject {|u| friends.include? u}
  end  
end
