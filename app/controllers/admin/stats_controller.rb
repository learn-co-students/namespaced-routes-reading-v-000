# When you create a new folder under /controllers, Rails will automatically pick that up as a module and expect you to namespace the controller accordingly. We need to modify our admin/stats_controller.rb to look like below
class Admin::StatsController < ApplicationController

  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end


#Now that we have our controller in a module, Rails will expect the views to match. Let's create a new directory at /app/views/admin/stats and move our stats/index.html.erb into it, so we'll wind up with /app/views/admin/stats/index.html.erb.
#If we try to reload /admin/stats now, we will get an error because we need to tell our routes about our new module.
