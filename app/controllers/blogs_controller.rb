class BlogsController < ApplicationController
  before_action :find_blog, only:[:show, :edit, :update, :destroy]
def index
  @blogs = Blog.all
end
def show
end
def new
  @blog = Blog.new
end
def create
  @blog = Blog.new(blog_params)
  if params[:back]
    render :new
  else
    if @blog.save
      redirect_to blogs_path, notice: "Posted.！"
    else
      render :new
    end
  end
end
def edit
end
def update
  if @blog.update(blog_params)
    redirect_to blogs_path, notice: "Edited.！"
  else
    render :edit
  end
end
def destroy
  @blog.destroy
  redirect_to blogs_path, notice: "Deleted.！"
end
def confirm
 @blog = Blog.new(blog_params)
 render :new if @blog.invalid?
end

private
def blog_params
  params.require(:blog).permit(:content)
end
def find_blog
  @blog = Blog.find(params[:id])
end
end
