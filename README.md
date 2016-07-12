# rss_reader
Simple Rss Reader

See live app here: http://ruby-rss-reader.herokuapp.com/

To run application on local machine:
1. Change database credentials from database.yml
2. Run rake db:create
3. Run rake db:migrate
4. Run rake update:feeds

On local machine, i am using crontab to run this rake task in every 10 mins. 

*/10 * * * *cd /Users/your/project/rss_reader && rake RAILS_ENV=development update:feeds
