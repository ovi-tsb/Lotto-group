desc "get winning numbers"
task :fetch_numbers => :environment do 

  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  url = "https://lottery.olg.ca/en-ca/lotto-games/lotto-max/about-lotto-max"
  doc = Nokogiri::HTML(open(url))
  top = doc.css('span.mw-headline')[0]&.text || '$0000'
  

data = doc.search('.winning-number li').map{ |li|
  li.search('.number').map { |p| p.text }
  }
  puts data

date = doc.css('.bar-title p')[0]&.text || '$0000'
  puts date

encore = doc.css('.encore-number .number')[0]&.text || '$0000'
  puts encore

bigprize = doc.css('.winning-price')[0]&.text || '$0000'
  puts bigprize


table = doc.css('table.prize-breakdown-table').first
# Fetches all rows (<tr>s)
if table
  rows = table.css('tr')


  text_all_rows = rows.map{|row|
    row.css('td').map(&:text)}
    puts text_all_rows
end  
MaxWiningNumber.create!(
        numero: data,
        from: date,
        numbers: encore,
        maxmillion: text_all_rows,
        maxmil: bigprize
      )
end

task :fetch649_numbers => :environment do 

  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  url = "https://lottery.olg.ca/en-ca/lotto-games/lotto-649/about-lotto-649"
  doc = Nokogiri::HTML(open(url))



  data = doc.search('.winning-number li').map{ |li|
    li.search('.number').map { |p| p.text }
    }
    puts data

  date = doc.css('.bar-title p')[0]&.text || '$0000'
    puts date

  encore = doc.css('.encore-number .number')[0]&.text || '$0000'
    puts encore

  bigprize = doc.css('.winning-price')[0]&.text || '$0000'
    puts bigprize

  guaranteed = doc.css('.single-prize span')[0]&.text || '$0000'
    puts guaranteed

  Six49WiningNumber.create!(
          numero: data,
          from: date,
          numbers: encore,
          maxmil: bigprize,
          guaranteedmil: guaranteed
        )

end

task :lottario_numbers => :environment do 

  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  url = "https://lottery.olg.ca/en-ca/lotto-games/lottario/about-lottario"
  doc = Nokogiri::HTML(open(url))

  data = doc.search('.winning-number li').map{ |li|
    li.search('.number').map { |p| p.text }
    }
    puts data

  date = doc.css('.bar-title p')[0]&.text || '$0000'
    puts date

  encore = doc.css('.encore-number .number')[0]&.text || '$0000'
    puts encore

  bigprize = doc.css('.winning-price')[0]&.text || '$0000'
    puts bigprize

  # guaranteed = doc.css('.single-prize span')[0]&.text || '$0000'
  #   puts guaranteed

  LottarioWiningNumber.create!(
          numero: data,
          from: date,
          numbers: encore,
          maxmil: bigprize
        )

end











