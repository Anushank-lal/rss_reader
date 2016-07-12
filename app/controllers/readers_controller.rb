class ReadersController < ApplicationController

  def show
    @feeds = Feed.all
  end

end
