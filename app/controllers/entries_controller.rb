class EntriesController < ApplicationController
  before_action :set_feed, only: :index

  def show
    @entry = Entry.find(params[:id])
  end

  def index
    @entries = @feed.entries.order('published desc')
  end

  private
  def set_feed
    @feed = Feed.find(params[:id])
  end
end
