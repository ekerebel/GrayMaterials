class Account < ActiveRecord::Base
    belongs_to :users
    has_many :listings
    validates :name, :address1, :state, :zip_code, :state, presence:true
end
