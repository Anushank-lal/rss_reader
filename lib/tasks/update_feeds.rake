require 'rss'
require 'open-uri'
namespace :update do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      open(feed.url) do |rss|
        content = RSS::Parser.parse(rss)
        content.items.each do |item|
          local_entry = feed.entries.where(title: item.title).first_or_initialize
          local_entry.update_attributes(content: item.description, author: item.author, url: item.link, published: item.pubDate)
        end
      end
    end
  end
end

