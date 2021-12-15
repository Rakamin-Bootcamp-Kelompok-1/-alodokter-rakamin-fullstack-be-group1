class Article < ApplicationRecord
     paginates_per 10
     # include ImageUploader::Attachment(:image)

     # validates :article_title, presence: true
 
end
