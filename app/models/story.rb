class Story < ActiveRecord::Base
    validates :title, presence: true
    validates :category, presence: true
    validates :upvotes, presence: true
    validates :link, presence: true
end
