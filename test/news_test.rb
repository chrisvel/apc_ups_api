require './lib/news/news'
require 'test/unit'

class TestNews < Test::Unit::TestCase

  def test_create_news
    assert_instance_of(News, News.new) #.has_content?
    assert_nothing_raised do
      huff = News.new
      puts huff.fetchdata
    end
    assert_raise(ArgumentError) { News.new(9) }

  end

  def has_content?
    if fetchdata != ''
      true
    else
      false
    end
  end

end
