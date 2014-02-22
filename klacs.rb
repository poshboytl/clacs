require_relative 'config/environment'

require 'sinatra/base'

class Klacs < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/messages' do
    Klacs.deliver(params[:message]) if params[:message]
    204
  end

  def self.deliver(message)
    Pusher['messages'].trigger('message-public',
                               "#{Time.now.to_s} => #{message}")
  end

end
