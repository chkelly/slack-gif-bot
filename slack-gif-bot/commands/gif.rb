module SlackGifBot
  module Commands
    class Gif < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        query = data.text.split('>: ')[1]
        images = GoogleCustomSearchApi.search(query, {:searchType => 'image', :fileType => 'gifv', :fileType => 'gif'})
        if images['items'].count > 0
          image = images['items'].sample.link
        else
          image = "Unable to find a matching Gif. Try a different query"
        end  
        client.say(text: image, channel: data.channel)
      end
    end
  end
end
