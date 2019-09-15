class TweetsController < ApplicationController
    before_action :move_to_index, except: [:index, :show]

    def index
        @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end

    def new
        @tweets = Tweet.new
    end

    def show
        @tweet = Tweet.find(params[:id])    
    end

    def create
        Tweet.create(image: tweet_params[:image], text: tweet_params[:text], cost: tweet_params[:cost], title: tweet_params[:title], material: tweet_params[:material], cooking_type: tweet_params[:cooking_type], user_id: current_user.id)
        redirect_to root_path    #←これは記事一覧ページに飛ばすようにする！！！！！！！！！
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy if tweet.user_id == current_user.id
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        tweet.update(tweet_params) if tweet.user_id == current_user.id
    end
    
    private

    def tweet_params
        params.require(:tweet).permit(:text, :image, :cost, :title, :material, :cooking_type)
    end

    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
   
end
