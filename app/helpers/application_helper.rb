module ApplicationHelper
  def display_avatar(user)
    unless user.avatar.nil?
      image_tag(user.avatar.url)
    else
      image_tag("..assets/default.png")
    end
  end
end
