
require "./config/enviorment.rb"


def run 
    puts " start running from run file"
end 


run
scrape
enviorment



page_audi = Scrape.new("https://www.autoevolution.com/audi/")
page_honda = Scrape.new("https://www.autoevolution.com/honda/")

y = page_honda.honda_selector


x = page_audi.audi_selector
binding.pry

