namespace :twitter do
  desc "Stream tweets from nyc to connected clients"
  task :stream => :environment do
    TwitterService.new.stream_nyc do |tweet|
      if !tweet["coordinates"]
        print 'F'
        next
      end

      Tweet.create_from_tweet!(tweet)
      print '.'
    end
  end

  desc "generate image based on tweet coordinates"
  task :image => :environment do
    filename = "tmp/tweet_pic_#{Time.now.to_i}.png"
    puts "Generating #{filename}"
    TweetImageService.new(1024, 1024).save filename
  end
end
