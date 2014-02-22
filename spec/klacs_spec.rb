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

  describe "POST /messages" do
    let(:message) { 'hola!' }


    context "with message params" do
      it "should be success and call deliver" do
        Klacs.should_receive(:deliver).with(message)
        post '/messages', message: message
        last_response.status.should == 201
      end
    end

    context "without message params" do
      it "should be success but without calling deliver" do
        Klacs.should_not_receive(:deliver)
        post '/messages'
        last_response.status.should == 201
      end
    end
  end
end
