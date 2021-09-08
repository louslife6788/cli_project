
def scrape
    puts "Hello_World from the Scrape file"
    
end


class Scrape 

    attr_reader :info , :headers, :url

    

    def get_body(url)
        html = open(url)
        home_page = Nokogiri::HTML(html)
        
    end


    def info_selector(url)

        models = []
      car_models =  get_body(url).css("div.carmodels.col23width.clearfix")
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

    def car_brands(url)
        options = []
        brand = get_body(url).css("div.container.carlist.clearfix")
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

    def model_choices(url)
        self.info_selector(url).each.with_index  do |car, i |
            puts "(#{i}).#{car[:name]}".white.on_red
           
        end 
    end


    def brand_choices(url)
        self.car_brands(url).each.with_index do |brand, i|
            puts "(#{i}). #{brand[:name]}".white.on_red
        end
    end
   
    
    def select_brand(url ="https://www.autoevolution.com/cars/", user_input)
        self.car_brands(url)[user_input][:link]
     end

         



 

end







