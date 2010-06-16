require 'rubygems'
  require 'sinbook'
  require 'sinatra'
#  require 'erb'
#  configure do
#    daemonize
#  end
require 'facebook'

 get '/' do
   # @fb = fb
   # erb :friends
fb.require_login!
  "Hi <fb:name uid=#{fb[:user]} useyou=false />!"
  result = fb.friends.get  :uid => fb[:user]
  markup = []
  markup << "<table border='1'>"
  result.each do |f|
    #markup  << "<fb:profile-pic size='square' uid='#{f}' facebook-logo='true'></fb:profile-pic>"
    markup << "<tr><td><fb:name uid='#{f}' shownetwork='true'></fb:name></td>" +
#"<td><fb:activity></fb:activity></td>" +
"<td><fb:profile-pic uid='#{f}' size='thumb'></fb:profile-pic></td>" +
"<td><fb:user-status uid='#{f}' linked='true'/></fb:user-status></td></tr>"
  end
	#fb.XFBML.parse(markup.to_s)
	markup << "</table>"
     markup.to_s
end
