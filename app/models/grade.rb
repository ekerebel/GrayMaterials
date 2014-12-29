class Grade < ActiveRecord::Base
    belongs_to :material
    has_many :listings
end
