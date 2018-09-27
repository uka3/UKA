class EvilsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])

      @evil = Evil.new(
        post_id: params[:post_id],
        user_id: current_user.id
      )

      if @evil.save
        redirect_to post_path(@post)
      else
        render template: 'posts/show'
      end
    end

    def destroy
     @evil = Evil.find_by(post_id: params[:post_id], user_id: current_user.id)
     @evil.destroy
     redirect_to post_path(params[:post_id])
    end

    private
      def evil_params
        params.require(:evil).permit(:post_id, :user_id)
      end
end
