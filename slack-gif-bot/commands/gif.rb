require 'httparty'

module SlackGifBot
  module Commands
    class Gif < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        query = data.text.split('>: ')[1]
        #Public API Key for now since giphy is in beta
        response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{URI.encode(query)}&api_key=dc6zaTOxFJmzC")
        images = response['data']

        if images.count > 0
          image = images.sample['url']
        else
          image = "Unable to find a matching Gif. Try a different query"
        end  
        client.say(text: image, channel: data.channel)
      end
    end
  end
end
