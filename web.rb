require 'sinatra/base'

module SlackGifBot
  class Web < Sinatra::Base
    get '/' do
      'Slack integration with Google Image Search.'
    end
  end
end
