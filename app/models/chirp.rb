# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord
    validates :body, presence: true
    # validates :author_id, presence: true
    validate :body_too_long

    def body_too_long
        if body && body.length > 140
            errors.add(:body, "too long")
        end
    end

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    has_many :likes,
        primary_key: :id,
        foreign_key: :chirp_id,
        class_name: :Like

    has_many :likers,
        through: :likes,
        source: :liker

    #Get first user record, use first

    #Get last user record, use last

    #Find a user that exists by id, use find

    #Find a user that doesn't exist by id, use find

    #Find a user by username, use find_by
    
    #Find a user by username that does not exist, use find_by

    #Find all users between the ages of 10 and 20 inclusive. Show their username, and political affiliation.

    #Find all users not younger than the age of 11. Use `where.not`

    #Find all political_affiliations of our users

    #Find all users who has a political affiliation in this list and order by ascending
    #political_affiliations = ["Ruby", "C"]
    
end
