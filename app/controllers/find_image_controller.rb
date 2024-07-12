class FindImageController < ApplicationController
    include FindImageHelper
    require 'httpclient'
    require 'nokogiri'
    def home
    end

    def find
        isbn=params[:ISBN]
        redirect_to book_image_path(isbn:isbn)
    end

    def show
        # client    = HTTPClient.new
        # url       = "https://ndlsearch.ndl.go.jp/thumbnail/#{params[:isbn].gsub(/-/,'')}.jpg"
        # response  = client.get(url)
        # @book_image=response.body
        @book_image=show_image(params[:isbn])
        
    end
end
