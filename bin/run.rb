
require "./config/enviorment.rb"


def run 
    puts " start running from run file"
end 


run
scrape
enviorment



page_scrape = Scrape.new("https://www.autoevolution.com/audi/")

x = page_scrape.get_body
binding.pry

