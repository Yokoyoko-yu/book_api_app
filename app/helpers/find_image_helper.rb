module FindImageHelper
    def show_image(isbn)
        client    = HTTPClient.new
        url       = "https://ndlsearch.ndl.go.jp/thumbnail/#{isbn.gsub(/-/,'')}.jpg"
        response  = client.get(url)
        @book_image=response.body
        return @book_image
    end
end
