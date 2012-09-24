require "nasa/version"
require "mechanize"
require "json"

module Nasa

  # Get the latest feed published on http:://data.nasa.gov
  # you will get 10 feeds by default.
  def self.get_latest_data(count=10)
    JSON.parse( Mechanize.new.get( self.url + "/get_recent_datasets?count=#{count}").body )
  end

  # if you know the id for a particular feed, then awesome. Get it via id.
  def self.search_by_id(id)
    JSON.parse( Mechanize.new.get( self.url + "/get_dataset?id=#{id}").body )
  end

  # whereas if you dont know the id and you do know the exact title then use this method.
  # Search for your data by title. Just pass in the slug.
  # What is slug ?
  # slug = title name in hyphen and downcase format.
  #
  # Ex: if title = "Mars Map Catalog"
  #     slug = title.downcase.split.join('_') => "mars-map-catalog"
  def self.search_by_slug(slug)
    JSON.parse( Mechanize.new.get( self.url + "/get_dataset?slug=#{slug}").body )
  end

  def self.url
    "http://data.nasa.gov/api/"
  end
end