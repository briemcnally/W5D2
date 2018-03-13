class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      sub_ids = params[:sub_ids]
      sub_ids.each do |sub_id|
        PostSub.create!(post_id: @post.id, sub_id: sub_id)
      end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.post_sub)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
