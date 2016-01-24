$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-gif-bot'
require 'web'

Thread.new do
  begin
    SlackGifBot::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackGifBot::Web
