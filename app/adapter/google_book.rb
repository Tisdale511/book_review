class GoogleBook

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
        title_arr = search_books_by_title(title)["items"].map do |get_title|
            get_title["volumeInfo"]["title"]
        end
    end

    def self.find_author_name(title)
        title_arr = search_books_by_title(title)["items"].map do |get_title|
            get_title["volumeInfo"]["title"]
        end
    end

end