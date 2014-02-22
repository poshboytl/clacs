class Klacs < Sinatra::Base
  get '/' do
    200
  end

  post '/messages' do
    Klacs.deliver(params[:message]) if params[:message]
    201
  end

  def self.deliver(message)
    # send to pusher
  end

end
