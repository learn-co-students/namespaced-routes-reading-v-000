class Admin::StatsController < ApplicationController

  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end

# When you create a new folder under
# /controllers, Rails will automatically pick that up as a module, and expect
# you to namespace the controller accordingly, so we need to modify our
# admin/stats_controller.rb to look like this:
