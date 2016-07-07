class PostsController < ApplicationController
	def index
		@posts = Post.paginate(page: params[:page], per_page: 30)
	end

	def show
    @post = Post.find(params[:id])
    render json: @post, only: [:title, :url, :author]
  end

  def index_json
    @posts = Post.all
    render json: @posts, only: [:title, :url, :author]
  end

  def delete_all
  	Post.delete_all
  	redirect_to :back
  end
end
