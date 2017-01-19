class Gallery < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
end
