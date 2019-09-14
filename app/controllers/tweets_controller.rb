class TweetsController < ApplicationController
    
    
    def index
        @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
    end

    def new
        @tweets = Tweet.new
    end

    def create
        Tweet.create(image: tweet_params[:image], text: tweet_params[:text], cost: tweet_params[:cost], title: tweet_params[:title], material: tweet_params[:material], cooking_type: tweet_params[:cooking_type], user_id: current_user.id)
        redirect_to root_path    #←これは記事一覧ページに飛ばすようにする！！！！！！！！！
    end

    private

    def tweet_params
        params.permit(:text, :image, :cost, :title, :material, :cooking_type)
    end

   
end
