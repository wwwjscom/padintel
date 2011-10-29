require 'rubygems'
require 'mechanize'
require 'parser/apt_features'

class AptDetailsPage

  attr_reader :url, :title, :features, :price, :neighborhood

  def initialize(url, title)
    @url = url
    @title = title
    @price = parse_price(title)
    @mech = Mechanize.new
    self
  end

  def parse_price(title)
    price = title[/\$\d+ /]
    begin
      price = price.delete('$').delete(' ')
    rescue
      price = nil
    end
    price
  end

  def parse
    @mech.get(@url) do |page|
      @body = page.search(".//div[@id='userbody']")
      begin
        neighborhood = page.search(".//h2").to_s
        neighborhood.gsub!('(map)', '')
        @neighborhood = neighborhood[neighborhood.rindex('(')..-6].gsub(/[\(|\)]/, '').strip
      rescue
        @neighborhood = nil
      end
    end
    @features = AptFeatures.new(@body)
    self
  end

  def check_features
    @features = AptFeatures.parse(@body)
  end

end
