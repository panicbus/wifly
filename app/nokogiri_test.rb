require 'nokogiri'
require 'open-uri'

    url = "http://www.berlin-airport.de/en/travellers-txl/at-the-airport/airport-services/wifi/"
     # "http://www.narita-airport.jp/en/guide/service/list/svc_33_wire.html"

    doc = Nokogiri::HTML(open(url))
    # puts doc.at_css("#contentWideCol").text

    doc.css("#contentCol").each do |item|
        paragraph = item.at_css("p").text#[/\bwifi\b|\bWiFi\b|\bWi-Fi\b|\bwi-fi\b/]
        puts "#{paragraph}"
        # puts item.at_css("p", "td")[:href]
    end

