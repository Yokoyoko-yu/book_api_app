class StaticPagesController < ApplicationController
  require 'httpclient'
  require 'nokogiri'

  BASE_URL="https://ndlsearch.ndl.go.jp/api/opensearch?"
  def home
    client    = HTTPClient.new
    url       = "https://ndlsearch.ndl.go.jp/thumbnail/9784062760812.jpg"
    response  = client.get(url)
    @image_data=response.body
  end

  def search_isbn(isbn)
    client    = HTTPClient.new
    url       = "https://ndlsearch.ndl.go.jp/thumbnail/#{isbn.gsub(/-/,'')}.jpg"
    response  = client.get(url)
    @image_data=response.body
  end

  # def find_book_image
  #   # client    = HTTPClient.new
  #   # response  = client.get(url)
  #   # @book_image=response.body
  #   isbn=params[:ISBN]
  #   redirect_to book_info_path(isbn:isbn)
  # end

  def show_book_info
    client=HTTPClient.new
    image_url="https://ndlsearch.ndl.go.jp/thumbnail/#{params[:ISBN].gsub(/-/,'')}.jpg"
    info_url="https://ndlsearch.ndl.go.jp/api/opensearch?isbn=#{params[:ISBN]}"
    image_response  = client.get(image_url)
    @book_image=image_response.body
    info_response=client.get(info_url)
    @xml_data=Nokogiri::XML(info_response.body)
    @book_title=@xml_data.xpath('//item//title').text
  end
    
  def search_author
  end


  def show_author 
    client=HTTPClient.new
    author_url="https://ndlsearch.ndl.go.jp/api/opensearch?creator=#{params[:author]}"
    author_response=client.get(author_url)
    @xml_data=Nokogiri::XML(author_response.body)
    @titles=@xml_data.xpath('//itme//title').text
  end




  # def self.search('query')
  #   client=HTTPClient.new
  #   base_url="https://ndlsearch.ndl.go.jp/api/sru?operation=searchRetrieve"
end
