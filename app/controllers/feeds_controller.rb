class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :authenticate_user
  before_action :logged_in?
  before_action :check_user, only: [:edit,:update,:destroy]  
  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def edit
  end

  def create
    @feed = current_user.feeds.build(feed_params)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to feeds_path, notice: 'Posted.！' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Edited.！' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Deleted.！' }
      format.json { head :no_content }
    end
  end

  def confirm
    @feed = current_user.feeds.build(feed_params)
    @feed.id = params[:id]
    render :new if @feed.invalid?
  end



  private
    # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def feed_params
    params.require(:feed).permit(:id, :image, :image_cache,:user_id,:content)
  end

end
