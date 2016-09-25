module UsersHelper

  def users_options_for_select
    users = User.all
    users.map { |user| [user.name, user.username] }
  end

end
