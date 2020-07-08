class GoogleBooks

    def self.search_books_by_title_and_author(title, author)
        key = ENV['google_book_key']
        url = "https://www.googleapis.com/books/v1/volumes?q=#{title}+inauthor:#{author}&key=#{key}"
        res = RestClient.get(url)
        json = JSON.parse(res)
    end

    def self.search_books_by_title(title)
        key = ENV['google_book_key']
        url = "https://www.googleapis.com/books/v1/volumes?q=#{title}+intitle:#{title}&key=#{key}"
        res = RestClient.get(url)
        json = JSON.parse(res)
    end

    def self.search_books_by_author(author)
        key = ENV['google_book_key']
        url = "https://www.googleapis.com/books/v1/volumes?q=inauthor:#{author}&key=#{key}"
        res = RestClient.get(url)
        json = JSON.parse(res)
    end

    def self.find_book_title(title)
        title_arr = search_books_by_title(title)["items"].map do |get_titles|
            get_titles["volumeInfo"]["title"]
        end
    end

    def self.find_author_name_books(author)
        author_arr = search_books_by_title(author)["items"].map do |get_authors|
            get_authors["volumeInfo"]["author"]
        end
       # byebug
    end

    def self.find_img_url(title, author)
         img_url_arr = search_books_by_title_and_author(title, author)["items"].map do |get_title|
        
         end
    end

end