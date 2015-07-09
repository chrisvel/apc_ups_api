require 'open-uri'

class Ups

  # constructor
  def initialize(url)
    @url = url
    @data = Hash.new
  end

  def fetchdata
    @buffer = JSON.load(open(@url).read)
    @buffer["ups"]["LINEV"] = @buffer["ups"]["LINEV"].split(" ")[0].to_f
    @buffer["ups"]["ITEMP"] = @buffer["ups"]["ITEMP"].split(" ")[0].to_f
    @buffer["ups"]["BCHARGE"] = @buffer["ups"]["BCHARGE"].split(" ")[0].to_f
    @buffer["ups"]["TIMELEFT"] = @buffer["ups"]["TIMELEFT"].split(" ")[0].to_f
    @buffer
    #puts @buffer['ups']['TIMELEFT']
  end
  
  def displaydata
    puts @url
  end

end
