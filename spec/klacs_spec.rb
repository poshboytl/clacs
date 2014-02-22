require File.join(File.dirname(__FILE__), '..', 'config', 'environment')
require 'rack/test'

include Rack::Test::Methods

  def app
    Klacs
  end


describe Klacs do

  describe "GET /" do
    it "should be success" do
      get '/'
      last_response.status.should == 200
    end
  end
end
