class TinyUrlsController < ApplicationController
  def create
  end
  private
    def relationship_params
      params.require(:tiny_urls).permit(:url)
    end
end
