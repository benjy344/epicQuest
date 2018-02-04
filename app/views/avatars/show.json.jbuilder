puts "@avatar"
puts current_user.avatar
puts "@avatar"
json.partial! "avatars/avatar", avatar: current_user.avatar
