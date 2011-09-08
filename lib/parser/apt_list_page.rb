# This class takes in a cl page which lists 100 apartment links.  It does various checks on those links, and then hands them off
# to another class for detailed parsing or skips them.
require 'rubygems'
require 'mechanize'
require 'parser/apt_details_page'

class AptListPage

  attr_reader :apts, :url

  def initialize(url)
    @apts = []
    @url = url
    @mech = Mechanize.new
    self
  end

	# Parses the links on the page and skips under certain conditions, or hands the detailed page link to another parser
  def parse(max_apts = 100)
    @mech.get(@url) do |page|
      i = 0
      page.links.each do |link|
        next if link.href == nil
        next if i >= max_apts
        next unless links_to_apt?(link)
				next if AptsTable.find_by_url(link.href)
        @apts << AptDetailsPage.new(link.href, link.to_s).parse
        i += 1
      end
    end
    self
  end

  #------------
  private
  def links_to_apt?(link)
    link = link.href
    # Check that it has the numbers at the end of the url to veryify its a link to an apt
    # http://washingtondc.craigslist.org/nva/apa/2540568584.html
    begin
      link[link.rindex('/')+1..link.rindex('.')-1][/^\d+$/] != nil
    rescue
      false
    end
  end

end
