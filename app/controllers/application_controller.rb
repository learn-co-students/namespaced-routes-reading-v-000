class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end

end
