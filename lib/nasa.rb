require "nasa/version"
require "mechanize"
require "json"

module Nasa

  # Get the latest feed published on http:://data.nasa.gov
  # you will get 10 feeds by default.
  def self.get_latest_data(count=10)
    JSON.parse( Mechanize.new.get( self.url + "get_recent_datasets?count=#{count}").body )
  end

  # if you know the id for a particular feed, then awesome. Get it via id.
  def self.search_by_id(id)
    JSON.parse( Mechanize.new.get( self.url + "get_dataset?id=#{id}").body )
  end

  # whereas if you dont know the id and you do know the exact title then use this method.
  # Search for your data by title. Just pass in the slug.
  # What is slug ?
  # slug = title name in hyphen and downcase format.
  #
  # Ex: if title = "Mars Map Catalog"
  #     slug = title.downcase.split.join('-') => "mars-map-catalog"
  def self.search_by_slug(slug)
    JSON.parse( Mechanize.new.get( self.url + "get_dataset?slug=#{slug}").body )
  end

  # if you know the id for a particular category, then awesome.
  # get all the data under a category via its id.
  # Pass in count too, default is 10
  def self.get_category_data_by_id(id, count=nil)
    self.build_the_url_and_fetch_data("get_category_datasets", "id", id, count)
  end

  # whereas if you dont know the id and you know the exact title then use this method.
  # Search for category data via title. Pass in the slug
  # What is slug ?
  # slug = category title name in hyphen and downcase format.
  #
  # Ex: category_title = "Earth Science"
  #     slug = category_title.downcase.split.join('-') => "earth-science"
  # Pass in count too, default is 10
  def self.get_category_data_by_slug(slug, count=nil)
    self.build_the_url_and_fetch_data("get_category_datasets", "slug", slug, count)
  end

  # if you know the id for a particular tag, then awesome.
  # get all the data under the tag via its id.
  # Pass in count too, default is 10
  def self.get_tag_data_by_id(id, count=nil)
    self.build_the_url_and_fetch_data("get_tag_datasets", "id", id, count)
  end

  # whereas if you dont know the id and you know the exact tag-name then use this method.
  # Search for category data via title. Pass in the slug
  # What is slug ?
  # slug = tag-name in hyphen and downcase format.
  #
  # Ex: category_title = "Earth Science"
  #     slug = category_title.downcase.split.join('-') => "earth-science"
  # Pass in count too, default is 10
  def self.get_tag_data_by_slug(slug, count=nil)
    self.build_the_url_and_fetch_data("get_tag_datasets", "slug", slug, count)
  end

  # returns a list of active categories along with
  # its slug, no of posts and title
  def self.get_active_categories
    JSON.parse( Mechanize.new.get( self.url + "get_category_index/").body )
  end

  # returns a list of active tags along with
  # its slug, no of posts and title
  def self.get_active_tags
    JSON.parse( Mechanize.new.get( self.url + "get_tag_index/").body )
  end

  def self.url
    "http://data.nasa.gov/api/"
  end

  def self.build_the_url_and_fetch_data(element_looking_for, slug_or_id, user_slug_or_id , count=nil)
    nasa_api_url = self.url + "#{element_looking_for}/?#{slug_or_id}=#{user_slug_or_id}"
    if count
      nasa_api_url = nasa_api_url + "&count=#{count}"
    end
    return JSON.parse( Mechanize.new.get( nasa_api_url ).body )
  end
end