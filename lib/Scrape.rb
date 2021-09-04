
def scrape
    puts "Hello_World from the Scrape file"
    
end


class Scrape 

    attr_reader :info , :headers, :url

    def initialize(url)
        @url = url
    end

    def get_body
        html = open(@url)
        home_page = Nokogiri::HTML(html)
        
    end


    def info_selector
        models = []
      car_models =  get_body.css("div.carmodels.col23width.clearfix")
      car_models.map.with_index(1) do |car|
         y = car.css("div.carmod.clearfix")
         y.map do |car_data|
            name = car_data.css("h4").text
            link = car_data.css("a").first["href"]
            models << {name: name, link: link}
            # binding.pry
        end
      end
      models
    end

    def car_brands
        options = []
        brand = get_body.css("div.container.carlist.clearfix")
        brand.map do |brands|
            y = brands.css("div.col2width.fl.bcol-white.carman")
            y.map do |brand_info|
                 name =  brand_info.css("span").text
                 link = brand_info.css("a").first["href"]
                 options << {name: name, link: link}
                
            end
        end
         options
    end

    def model_choices
        
        x = 1 
        self.info_selector.each  do |car|
            puts "#{x}//#{car[:name]}"
            x += 1
            # binding.pry
        end 
    end


    def brand_choices
        self.car_brands.each.with_index do |brand, i|
            puts "(#{i}). #{brand[:name]}".white.on_red
        end
    end
   
    
    def select_brand(user_input)

        self.car_brands[user_input][:link]
     end

         



 

end







