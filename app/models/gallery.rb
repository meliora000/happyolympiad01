class Gallery < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
