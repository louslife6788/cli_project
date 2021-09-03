
require "./config/enviorment.rb"


def run 
    puts "Hello_World from run file"
end 


run
scrape
enviorment

car_brand = Scrape.new("https://www.autoevolution.com/cars/")


page_audi = Scrape.new("https://www.autoevolution.com/audi/")
page_honda = Scrape.new("https://www.autoevolution.com/honda/")
page_chevy = Scrape.new("https://www.autoevolution.com/chevrolet/")

# brands = car_brand.car_brands
 honda = page_honda.info_selector
# chevy = page_chevy.info_selector
# audi = page_audi.info_selector

