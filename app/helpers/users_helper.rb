module UsersHelper
  def pluralize_shir(shirs)
    return 'Shirs ('+shirs.to_s+')' if shirs > 1
    return 'Shir'
  end
end
