class Admin::StatsController < ApplicationController
# the classname must be prefixed by Admin because it is now located in the Admin dir and not at the Controllers root dir
  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end
