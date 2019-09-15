class Tweet < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    validates :title,:material,:cost,:image, presence: true
end
