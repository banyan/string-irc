$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'net/irc'
require 'string-irc'

class Client < Net::IRC::Client
  def on_rpl_welcome(m)
    post JOIN, opts.channel
  end

  def on_privmsg(m)
    channel, message = *m
    if message =~ /ping/
      post NOTICE, channel, reply
    end
  end

  def reply
    si = StringIrc.new('pong')
    si.red.bold.to_s
  end
end

options = {
  :nick     => "sibot",
  :user     => "sibot",
  :real     => "sibot",
  :channel  => "",
  :password => "",
}
client = Client.new("irc.freenode.net", 6667, options)
client.start
