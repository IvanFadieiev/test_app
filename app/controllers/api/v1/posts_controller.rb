# posts API module
module Api
  module V1
    # Post API controller
    class PostsController < ApplicationController
      def show
        @post = Post.find(params[:id])
        render json: @post, only: [:title, :url, :author]
      end

      def index_json
        @posts = Post.all
        render json: @posts, only: [:title, :url, :author]
      end
    end
  end
end
