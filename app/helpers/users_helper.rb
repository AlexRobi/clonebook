module UsersHelper
  require 'faker'

  # Generate an avatar picture.
  def generate_avatar
    Faker::Avatar.image("#{SecureRandom.urlsafe_base64}", "150x150", "jpg", "set4", "bg2")
  end
end
