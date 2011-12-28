class RolesController < InheritedResources::Base
  @categories = Category.all
end
