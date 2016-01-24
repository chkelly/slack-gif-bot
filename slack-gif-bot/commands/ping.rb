module SlackGifBot
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        client.say(text: 'pong', channel: data.channel)
      end
    end
  end
end
