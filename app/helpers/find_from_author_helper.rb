module FindFromAuthorHelper
    require 'httpclient'
    require 'nokogiri'
    require 'uri'

    
    def search_author(author)
        client=HTTPClient.new
        encoded_author=URI.encode_www_form_component(author)
        author_url="https://ndlsearch.ndl.go.jp/api/opensearch?creator=#{encoded_author}"
        author_response=client.get(author_url)
        @xml_data=Nokogiri::XML(author_response.body)
        # return @xml_data.xpath('//item//title').text
        return @xml_data
    end

    def search_title(title)
        client=HTTPClient.new
        encoded_title=URI.encode_www_form_component(title)
        title_url="https://ndlsearch.ndl.go.jp/api/opensearch?title=#{encoded_title}"
        title_response=client.get(title_url)
        @xml_data=Nokogiri::XML(title_response.body)
        return @xml_data
    end
end
