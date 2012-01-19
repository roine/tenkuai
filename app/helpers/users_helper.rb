module UsersHelper
  def format_shir
    shirs = @user.shirs.count
    return 'Shirs ('<<shirs.to_s<<')' if shirs > 1
    else 'Shir'
  end
end
