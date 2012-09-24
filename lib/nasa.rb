require "nasa/version"
require "mechanize"
require "json"

module Nasa

  # Get the latest feed published on http:://data.nasa.gov
  # you will get 10 feeds by default.
  def self.get_latest_data(count=10)
    JSON.parse( Mechanize.new.get( self.url + "/get_recent_datasets?count=#{count}").body )
  end

  def self.search_data_by_id(id)
    JSON.parse( Mechanize.new.get( self.url + "/get_dataset?id=#{id.to_i}").body )
  end

  def self.search_data_by_slug(slug)
    JSON.parse( Mechanize.new.get( self.url + "/get_dataset?slug=#{slug.to_s}").body )
  end

  def self.url
    "http://data.nasa.gov/api/"
  end
end