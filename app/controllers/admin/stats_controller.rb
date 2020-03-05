<<<<<<< HEAD:app/controllers/admin/stats_controller.rb
class Admin::StatsController < ApplicationController
=======
class Admin::  StatsController < ApplicationController
>>>>>>> 5185520c521c975936111c14e6d706f87517117c:app/controllers/admin/stats_controller.rb

  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end
