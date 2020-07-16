#class StatsController < ApplicationController
class Admin::StatsController < ApplicationController
#When you create a new folder under /controllers, Rails will automatically pick that up as a module 
#and expect you to namespace the controller accordingly. 
  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end

end
