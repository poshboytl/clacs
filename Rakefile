require_relative 'config/environment'

desc "A rails like console"
task :c do
  exec "irb -I. -rconfig/environment"
end

desc "Test pusher"
task :push do
  Pusher['messages'].trigger('message-public', "hola! #{Time.now.to_s}")
end
