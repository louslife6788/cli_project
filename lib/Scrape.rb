
def scrape
    puts "Hello_World from the Scrape file"
    
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


    def info_selector
      car_models =  get_body.css("div.carmodels.col23width.clearfix")
      car_models.map.with_index(1) do |car|
         y = car.css("div.carmod.clearfix")
         y.map do |car_data|
            car_data.css("h4").text
            
            
         end
      end
    end

    def car_brands
        options = []
        brand = get_body.css("div.container.carlist.clearfix")
        brand.map do |brands|
            y = brands.css("div.col2width.fl.bcol-white.carman")
            y.map do |brand_info|
                 options << brand_info.css("span").text
                 options << brand_info.css("a").first["href"]
                
                


            end
        end
        options
    end


   



 

end







