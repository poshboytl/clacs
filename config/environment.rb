require 'rubygems'
require 'bundler/setup'

require 'sinatra'

require 'pusher'
require 'yaml'

require File.join(File.dirname(__FILE__), '..', 'klacs')

PUSHER_CONFIG = YAML.load_file('config/pusher.yml')['pusher']

Pusher.app_id = PUSHER_CONFIG['app_id']
Pusher.key = PUSHER_CONFIG['key']
Pusher.secret = PUSHER_CONFIG['secret']
