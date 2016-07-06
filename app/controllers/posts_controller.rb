class PostsController < ApplicationController
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to :root
		end
	end

	private
	def method_name
		params.require(:post).permit(:title, :author, :url)
	end
end
