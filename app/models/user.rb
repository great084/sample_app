class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through:  :relationships, source: :followed 
  has_many :reverse_relationships, foreign_key: "followed_id", 
                                   class_name: :Relationship,
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :following
  validates :name,  presence: true, length: { maximum: 50 }
  
  def feed
    Micropost.where("user_id = ?", id)
    #Micropost
  end
  
  def following?(other_user)
    relationships.find.by(follow_id :other_user.id)
  end

  def follow!(other_user)
    relationships.create.by(follow_id :other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find.by(follow_id :other_user.id).destroy
  end


  
end
