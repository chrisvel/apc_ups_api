require 'open-uri'
require 'json'
require 'rss'
require_relative 'config'
require_relative 'lib/weather/weather'
require_relative 'lib/news/news'
require_relative 'lib/ups/ups'
require 'unirest'

#set :bind, '0.0.0.0'

def tocelsius(degrees)
  celsius = (degrees - 32) / 1.8
  puts celsius
  celsius
end

# Initialize Weather object for Athens, Gr
Athens = Weather.new('37.968308', '23.732417')
Karditsa = Weather.new('39.365904', '21.922546')
Home_UPS = Ups.new('http://hyp3rkyd.no-ip.org:4567/api/upsdata')

# Initialize objects for news sites
Huffington = News.new(
  Config::News::HUFFINGTON[:title], 
  Config::News::HUFFINGTON[:url],
  Config::News::HUFFINGTON[:lang]
  )
CNN_World = News.new(
  Config::News::CNN_WORLD[:title],
  Config::News::CNN_WORLD[:url],
  Config::News::CNN_WORLD[:lang]
  )
NYTimes_World = News.new(
  Config::News::NYTIMES_WORLD[:title],
  Config::News::NYTIMES_WORLD[:url],
  Config::News::NYTIMES_WORLD[:lang]
  )
Protothema = News.new(
  Config::News::PROTOTHEMA[:title],
  Config::News::PROTOTHEMA[:url],
  Config::News::PROTOTHEMA[:lang]
  )

while true do
  #Thread.new do
    @news = {}
    @temp = {}
    @ups = {}
  
    @temp["Athens"] = Athens.fetchdata
    puts "Athens weather data fetched [OK]"
  
    @temp["Karditsa"] = Karditsa.fetchdata
    puts "Karditsa weather data fetched [OK]"
  
    @ups = Home_UPS.fetchdata
    puts "Home UPS data fetched [OK]"
  
    # export all temperature data to json 
    File.open("temp_data.json","w") do |f|
      f.write(@temp.to_json)
    end
    puts "Temp data exported to JSON [OK]"

    @news[Config::News::HUFFINGTON[:title]] = Huffington.fetchdata 
    puts "Huffington feed data fetched [OK]"
  
    @news[Config::News::PROTOTHEMA[:title]] = Protothema.fetchdata 
    puts "Proto thema feed data fetched [OK]"
  
    @news[Config::News::CNN_WORLD[:title]] = CNN_World.fetchdata  
    puts "CNN World feed data fetched [OK]"
  
    @news[Config::News::NYTIMES_WORLD[:title]] = NYTimes_World.fetchdata  
    puts "NY Times World feed data fetched [OK]"
    
    # export all news data to json 
    File.open("news_data.json","w") do |f|
      f.write(@news.to_json)
    end
    puts "News data exported to JSON [OK]"
    
    # export all news data to json 
    File.open("ups_data.json","w") do |f|
      f.write(@ups.to_json)
    end
    puts "Ups data exported to JSON [OK]" 
      
    #sleep 600
    (1..60).each do |s|
      print "#"
      sleep 1
    end
  puts
    
  #end
end

