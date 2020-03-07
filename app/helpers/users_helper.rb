module UsersHelper
  def user_avatar(user)
    image = user.avatar.attached? ? user.avatar : 'astronaut.svg'
    image_tag(image,  class:'block lg:inline-block h-12 w-12 rounded-full mx-auto object-cover')
  end
end
