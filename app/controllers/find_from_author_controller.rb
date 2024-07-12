class FindFromAuthorController < ApplicationController
    include FindFromAuthorHelper
    require 'httpclient'
    require 'nokogiri'

    def home
    end
    def find
        if params[:author]
            redirect_to show_author_path(author:params[:author])
        elsif params[:title]
            redirect_to show_author_path(title:params[:title])
        end
        
    end
    def show
        # @data=search_author(params[:author])
        if params[:author]
            @data=search_author(params[:author])
            @data_item=@data.xpath('//item')
        elsif params[:title]
            @data=search_title(params[:title])
            @data_item=@data.xpath('//item')
        end
    end
end
