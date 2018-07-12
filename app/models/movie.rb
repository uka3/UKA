class Movie < ApplicationRecord
    belongs_to :videoble, polymorphic: true
    mount_uploader :video, VideoUploader
end
