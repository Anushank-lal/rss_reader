require 'rss'
require 'open-uri'
namespace :update_feeds do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      open(feed.url) do |rss|
        content = RSS::Parser.parse(rss)
        # puts "Title: #{feed.channel.title}"
        # feed.items.each do |item|
        #   puts "Item: #{item.title}"
        # end
        content.items.each do |item|
          local_entry = feed.entries.where(title: item.title).first_or_initialize
          local_entry.update_attributes(content: item.description, author: item.author, url: item.link, published: item.pubDate)
          p "Synced Entry - #{item.title}"
        end
        p "Synced Feed - #{feed.description}"
      end
    end
  end
end

