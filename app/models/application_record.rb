class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_blog
    @current_blog = @blog.id
  end
end
