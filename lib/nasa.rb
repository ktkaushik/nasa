require "nasa/version"
require "nasa/nasa"
require "mechanize"
require "json"

module Nasa

  def self.get_latest_data(count=10)
    JSON.parse( Mechanize.new.get( self.url + "/get_recent_datasets?count=#{count}").body )
  end

  def self.url
    "http://data.nasa.gov/api/"
  end
end