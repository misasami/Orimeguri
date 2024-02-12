class Kimono < ApplicationRecord

    belongs_to :user
    mount_uploader :image, ImageUploader

    has_many :bookmarks, as: :bookmarkable

    mount_uploader :video, VideoUploader

    attr_accessor :video

end
