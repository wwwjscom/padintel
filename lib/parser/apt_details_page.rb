require 'rubygems'
require 'mechanize'
require 'parser/apt_features'

class AptDetailsPage

  attr_reader :url, :title, :features

  def initialize(url, title)
    @url = url
    @title = title
    @mech = Mechanize.new
    self
  end

  def parse
    @mech.get(@url) do |page|
      @body = page.search(".//div[@id='userbody']")
    end
    @features = AptFeatures.new(@body)
    self
  end

  def check_features
    @features = AptFeatures.parse(@body)
  end

end
