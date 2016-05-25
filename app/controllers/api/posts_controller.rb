module Api
  class PostsController < BaseController
    skip_before_action :require_auth_token, only: [:all, :search, :show]

    def all
      count = params[:count] || 20
      page = params[:page] || 1
      @posts = Post.where(open: 1).page(page).per(count).order(created_at: :desc)
      # render json: Rabl::Renderer.json(@post, 'api/posts/index'), callback: params[:callback] || 'callback'
      render 'api/posts/index'

    end

    def index
      @posts = Post.where(user_id: current_user.id)
    end

    def show
      @post = Post.find(params[:id])
    end

    def create
      count = Post.where('user_id = ? and created_at > ? and spot_id = ?', current_user.id, Time.now.midnight, params[:spot_id]).count
      if count >= 10
        render_success('하루 10개를 초과 했습니다')
        return
      end
      puts current_user.id
      puts params[:content]
      puts params[:hashtags]
      puts params[:spot_id]

      @post = Post.create!(user_id: current_user.id, content: params[:content], hashtags: params[:hashtags], img: params[:img], media: params[:media], spot_id: params[:spot_id])
      render :show
    end

    def open
      count = Post.where('user_id = ? and created_at > ? and open = 1', current_user.id, Time.now.midnight).count
      if count > 5
        render_success('하루 5개를 초과 했습니다')
        return
      end
      Post.where('id IN (?)', params[:ids].split(',')).update_all(open: true)
      render_success('성공')
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      render_success('성공')
    end

    def search
      count = params[:count] || 20
      page = params[:page] || 1
      text = "%#{params[:text]}%"
      spot_id = params[:spot_id]
      post_where = Post.where('open = 1 and (content LIKE ? OR hashtags LIKE ?)', text, text)
      if spot_id.nil?
        @posts = post_where.page(page).per(count).order(created_at: :desc)
      else
        @posts = post_where.where(spot_id: spot_id).page(page).per(count).order(created_at: :desc)
      end
      render 'api/posts/index'
    end
  end
end
