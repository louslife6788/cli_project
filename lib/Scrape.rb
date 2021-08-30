
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


    def audi_selector
      audi_colum =  get_body.css("div.carmodels.col23width.clearfix")
      audi_colum.map.with_index(1) do |audi|
         y = audi.css("div.carmod.clearfix")
         y.map do |name|
            name.css("h4").text
            
         end
      end
    end

    def honda_selector
        honda_colum =  get_body.css("div.carmodels.col23width.clearfix")
        honda_colum.map.with_index(1) do |honda|
           y = honda.css("div.carmod.clearfix")
           y.map do |name|
              name.css("h4").text
              
           end
        end
      end






 

end







