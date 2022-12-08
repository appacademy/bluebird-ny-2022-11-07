# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string           not null
#  email                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  political_affiliation :string           not null
#  age                   :integer          not null
#
class User < ApplicationRecord
    validates :username, :email, presence: true, uniqueness: true

    has_many :chirps,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Chirp

    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like

    has_many :liked_chirps,
        through: :likes,
        source: :chirp


    #Find all chirps for a particular user

    #Find all chirps liked by people politically affiliated with JavaScript

    #Get only the unique values from the previous query

    #Find all chirps with no likes

    #Find how many likes each chirp has

    #Find chirps with at least 3 likes



























    
    # Includes #

    # def self.see_chirp_authors_n_plus_one
    #     # the "+1"
    #     chirps = Chirp.all

    #     # the "N"
    #     chirps.each do |chirp|
    #         puts chirp.author.username
    #     end

    # end

    # def self.see_chirps_optimized
    #     # pre-fetches data
    #     chirps = Chirp.includes(:author).all

    #     chirps.each do |chirp| 
    #     # uses pre-fetched data 
    #         puts chirp.author.username
    #     end
    # end

    # # Joins #

    # def self.see_chirp_num_likes_n_plus_one
    #     chirps = Chirp.all

    #     chirps.each do |chirp|
    #         puts chirp.likes.length
    #     end
    # end

    # def self.see_chirp_num_likes_optimized
    #     chirps_with_likes = Chirp
    #         .select("chirps.*, COUNT(*) AS num_likes")
    #         .joins(:likes)
    #         .group(:id)
    
    #     chirps_with_likes.each do |chirp|
    #         puts chirp.num_likes
    #     end
    # end
end
