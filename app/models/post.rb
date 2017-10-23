class Post < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    after_create :add_favorite_for_user
    
    default_scope { order('rank DESC') }
    #scope :ordered_by_title, -> { reorder(title: :asc) }
    #scope :ordered_by_reverse_created, -> { reorder('created_at DESC').reverse_order }
    
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
    def up_votes
        votes.where(value: 1).count
    end
    
    def down_votes
        votes.where(value: -1).count
    end
    
    def points
        votes.sum(:value)
    end
    
    def update_rank
        age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
        new_rank = points + age_in_days
        update_attribute(:rank, new_rank)
    end
    
    private
    
    def add_favorite_for_user
        favorite.create(post: slef, user: self.user)
        favoriteMailer.new_post(self).deliver_now
    end
end
