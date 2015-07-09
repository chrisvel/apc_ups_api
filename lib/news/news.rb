class News

  # constructor
  def initialize(title, url, lang)
    @url = url
    @title = title
    @lang = lang
    @feed = ''
    @news = Hash.new
  end

  def fetchdata
    @news = {}
    open(@url) do |rss|
      @feed = RSS::Parser.parse(rss)
      #puts "Title: #{@feed.channel.title}"
      h = Array.new
      @feed.items.each_with_index do |item, id|
        h[id] = { :pubdate => item.pubDate,
                  :title => item.title,
                  :guid => item.guid.to_s.match(/http.+?(?=<\/guid>)/),
                  :description => item.description
                }
      end
      @news = h
    end
    @news
  end
  
  def exporttojson
    File.open("data.json","w") do |f|
      f.write(@news.to_json)
    end
  end
  
  def displaydata
    puts "Right now: #{ @weather_data['weather'][0]['main'] }"
    puts "Temp: #{ @weather_data['main']['temp'] }"
  end

end
