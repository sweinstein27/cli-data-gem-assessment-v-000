class StockScraper::Scraper


  def self.scrape_stock_movers
       doc = Nokogiri::HTML(open('https://money.cnn.com/data/us_markets/'))
       doc.css("#wsod_whatsMoving").css("td.wsod_firstCol").map do |row|
         stock_symbol = row.css(".wsod_symbol").children.text
         stock_name = row.css("span").text
         url = row.css(".wsod_symbol").attribute("href").value
         stock_hash = {
           :stock_symbol => stock_symbol,
           :stock_name => stock_name,
           :url => url
         }
        end
     end

  def self.scrape_individual_stock_news(which_stock)
    doc =  Nokogiri::HTML(open("https://money.cnn.com"+which_stock.url))
    doc.css(".wsod_newsTable").children.children.map do |article|
        if article.children.first
          news = article.children.first.text
      end
    end
  end

  def self.scrape_individual_stock_article_text(which_article)

end
