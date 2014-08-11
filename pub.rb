# usage:
# ruby pub.rb channel username

require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new

data = {"user" => ARGV[1]}

$redis.publish ARGV[0], data.merge('msg' => "#{ARGV[1]} has joined").to_json

loop do
  msg = STDIN.gets
  $redis.publish ARGV[0], data.merge('msg' => msg.strip).to_json
end
