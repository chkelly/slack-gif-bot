# Summary

This is a very simple but powerful slack bot that allows you to provide a text string and return an animated gif. The source of these gifs is controllable by you via googles custom search API. However Google does sadly charge for this beyond 100 requests/day. I'll be exploring alternatives to this if you plan to exceed this and also do not wish to pay for additional requests.

# Requirements

Unfortunately this does required a little bit of setup first to get running. You need to complete the below steps before running an instance of this app. 

## How to Generate Slack API Token
  1. From a web browser visit the admin page for your slack organization. (Should be orgname.slack.com/admin)
  1. Click on Configure Apps
  1. Click on the Custom Integrations Tab
  1. Click Bots
  1. Click Add Configuration
  1. Give your bot a name and click Add Bot Integration
  1. You now should see your API Token. Use this below for SLACK_API_TOKEN


## How to Generate Google API Key

Note that google is kind of stingy with API requests. you get a Quota of 100/day unless you are willing to pay (5 bucks for 1k). This is pretty lame, so ill be looking for alternatives or ways around this.

  1. From a web browser visit https://console.developers.google.com/apis/library
  1. Under Other Popular APIs click on "Custom Search API"
  1. Click the Enable API Button
  1. Click Credentials on the left hand side
  1. Click New Credentials and select API KEy
  1. Click Server Key
  1. Enter a descriptive name for the key, and specify a server ip if you wish (not required)
  1. This Key is your GOOGLE_API_KEY

## How to Configure Google Custom Search and Generate CX Key
  1. From a web browser visit https://cse.google.com/cse/all
  1. Click New Search Engine
  1. Enter an initial site to search (such as imgur.com)
  1. Provide a name for the search engine
  1. Click Control Panel
  1. Turn image Search On
  1. Under Sites to Search Enter a list of domains that you want to search for gifs. Alternativly, you can use the drop down to the right in order to search the entire web. However I recommend leaving it on only searching the included sites and entering the following:
    * imgur.com
    * giphy.com
    * gifbin.com
    * gifgifgifgifgif.com
    * awesomegifs.com
    * reactiongifs.com
    * devopsreactions.tumblr.com
    * animatedgif.net

  1. Click Search Engine ID. Use this value for GOOGLE

# Deployment
 The preferred method would be running the docker container.

## Running a prebuilt container

Now that you have the three items from the above you can run a prebuilt container and immediately start using this bot. Just run the following wherever you want the bot to run.

```
docker run -d -e SLACK_API_TOKEN=<Slack_API_Token> -e GOOGLE_API_KEY=<Google_API_Key> -e GOOGLE_SEARCH_CX=<Google_Search_CX> --restart=always chkelly/slack-gif-bot:v1.0.0
```

## Running it on the CLI

If you don't want to use the docker image for whatever reason you can checkout this repo somewhere and run the following.

```
bundle install --deployment
bundle exec puma -p 8080
```

# Bot Managment and supported commands

Note that for commands, the bot will also respond without the @. The bot will also respond in private message without the bot's name.

## Joining a channel
Your bot should now be connected. You can add the bot into specific channel by sending it an invite. Enter the channel you want to invite the bot too and type `/invite @<bot_name> `. The bot should now be in the channel.

## Testing communication

@<bot_name> ping should cause the bot to return with "pong" immediately in channel

## Random Gif

@<bot_name> gif <some text> will cause the bot to google image search and return a random gif from the first 10 results. Note that if you experience a limited selection, or no gifs at all, be sure to pay extra close attention to the instructions above around configuration of Google's Custom Search.

# Contributing

## Testing
I'll add testing shortly.

## Pull Requests
Pull Requests are welcome. Please fork and create a feature branch.

## Issues

Feel free to create an issue in the event that you experience any issues or would like a specific feature.
