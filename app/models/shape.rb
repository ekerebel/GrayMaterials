class Shape < ActiveRecord::Base
    if Rails.env.development?
        has_attached_file :image, :styles => { :medium => "200x", :thumb => "80x>" }, :default_url => "NoImage.png"
        validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    else
        has_attached_file :image, :styles => { :medium => "200x", :thumb => "80x>" }, :default_url => "NoImage.png",
         :storage => :dropbox,
          :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
          :dropbox_visibility => 'public'
        validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    end
    has_many :listings
end
