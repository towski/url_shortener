class TinyUrlsController < ApplicationController
  def new
    @tiny_url = TinyUrl.new 
  end

  def create
    @tiny_url = TinyUrl.new tiny_url_params
    if @tiny_url.save
      redirect_to tiny_url_path(@tiny_url)
    else
      render :new
    end
  end

  def show
    @tiny_url = TinyUrl.find_by_id(params[:id])
    if @tiny_url
      @url = "http://#{request.host_with_port}/#{@tiny_url.tiny_path}"
    end
  end

  def redirect
    tiny_url = TinyUrl.find_by_tiny_path(params[:id])
    if tiny_url
      redirect_to tiny_url.url
    else
      flash[:notice] = "Tiny url not found"
      redirect_to new_tiny_url_url
    end
  end
  private
    def tiny_url_params
      params.require(:tiny_url).permit(:url)
    end
end
