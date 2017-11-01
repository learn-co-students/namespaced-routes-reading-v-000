class StatsController < ApplicationController

  def index
    require 'pry'
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
    binding.pry
  end
end
