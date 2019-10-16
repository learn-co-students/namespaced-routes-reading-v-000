# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/namespaced-routes

# When you create a new folder under /controllers, Rails will automatically
# pick that up as a module and expect you to namespace the controller
# accordingly. We need to modify our admin/stats_controller.rb to look like this:

# new code start
class Admin::StatsController < ApplicationController
# new code end

# deleted code
# class StatsController < ApplicationController

  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end
