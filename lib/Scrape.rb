
def scrape
    puts "Hello_world from the Scrape file"
    
end


class Scrape 

    attr_reader :info , :headers

    def initialize(url)
        @url = url
    end

    def get_body
        html = open(@url)
        home_page = Nokogiri::HTML(html)
        
    end


    def selector
        get_body.css()
        
    end


 






end







