class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 2).order('created_at DESC')
    #@posts = Post.all
    respond_to do |format|
     format.html
     format.js
   end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
 end

 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
