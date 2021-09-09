
require "./config/enviorment.rb"





brand_url =("https://www.autoevolution.com/cars/")


website = Scrape.new
website.brand_choices("https://www.autoevolution.com/cars/")
puts "Anika please select a brand using 1 to 117?".white.on_blue

input = gets.to_i
brand = website.select_brand(input)

website.model_choices(brand)




# car_brand.brand_choices

# page_audi = Scrape.new("https://www.autoevolution.com/audi/")
# page_honda = Scrape.new("https://www.autoevolution.com/honda/")
# page_chevy = Scrape.new("https://www.autoevolution.com/chevrolet/")



# honda = page_honda.info_selector
# chevy = page_chevy.info_selector
# audi = page_audi.info_selector

# audi_choice = page_audi.model_choices
# car_brand.brand_choices

# path to get link ..$ car_brand.car_brands[0][:link]


# def run 
#     puts "Hello_World from run file"
# end 


# run
# scrape
# enviorment


