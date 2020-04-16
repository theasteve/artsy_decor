# frozen_string_literal: true

# User helper to display user avatar
module UsersHelper
  AVATAR_CLOUDINARY_IMAGE_ID = 'add_wzvex8'
  AVATAR_STYLES = 'block lg:inline-block h-12 w-12 rounded-full mx-auto object-cover'
  AVATAR_ADD_ICON = 'add_wzvex8'

  def user_avatar(user)
    if user.avatar.attached?
      cl_image_tag(user.avatar.key, class: AVATAR_STYLES)
    else
      cl_image_tag(AVATAR_CLOUDINARY_IMAGE_ID, class: AVATAR_STYLES)
    end
  end
end
