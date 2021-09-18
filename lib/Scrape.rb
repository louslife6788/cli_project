
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

    def each_model(url)
        option = []




    end

    def model_choices(url)
        self.info_selector(url).each.with_index(1)  do |car, i |
            puts "(#{i}).#{car[:name]}".white.on_red
           
        end 
    end


    def brand_choices(url)
        self.car_brands(url).each.with_index(1) do |brand, i|
            puts "(#{i}). #{brand[:name]}".white.on_red
        end
    end
   
    
    def select_brand(url ="https://www.autoevolution.com/cars/", user_input)
        self.car_brands(url)[user_input][:link]
     end


    def select_model(url, user_input)
        
        self.info_selector(url)[user_input][:link]

    end



    def collect_car(url)
        cars = []
        block = self.get_body(url).css("div#pagewrapper")
        block.map  do |car|
            each_car = car.css("div.container.carmodel.clearfix")
            each_car.map do |atrib|
                title = atrib.css("a").first["title"]
                power = atrib.css("span.col-green2").text
                info = atrib.css("p.txt").text

                cars << [title[..-18], info, power]

            end
        end
        puts cars[0][0].blue.on_white
        puts cars[0][2].green.on_white
        puts cars[0][1].blue.on_white
       
    end 


end




def run_car

    website = Scrape.new
    website.brand_choices("https://www.autoevolution.com/cars/")
    puts "Lou please select a brand using 1 to 118?".white.on_blue
    input = gets.to_i
    if input != input.to_i || input == 0 || input > 118
        run_car
    else
        brand = website.select_brand(input-1)
        website.model_choices(brand)
        
        
        puts "please selcect a model using the index number".white.on_blue
        input = gets.to_i
        if input != input.to_i || input == 0 || input > website.model_choices(brand).size 
            run_car
        else
             model = website.select_model(brand, input-1)
             website.collect_car(model)
             puts "Would You like to find another car? (Y/N)".red
             input = gets.chomp.upcase
             if input.include?("Y")
                run_car
             else
                stop
             end

             
        end


    end




end


def stop
     
    puts "OK , SEE YOU LATER ".yellow

end


