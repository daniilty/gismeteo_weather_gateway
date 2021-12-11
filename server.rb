this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'info'
require 'server_pb'
require 'server_services_pb'

def get_env(key)
  env = ENV[key]
  
  if env.nil?
    puts "please provide \"#{key}\" environment variable"
    exit
  end

  env
end

class GismeteoServer < Gismeteo::GismeteoWeatherGateway::Service
  attr_accessor :info

  def initialize
    @info = Info.new
  end

  def get_weather(empty, _unused_call)
    Gismeteo::Weather.new(info: @info.get_weather)
  end
end

s = GRPC::RpcServer.new
s.add_http2_port(get_env('GRPC_SERVER_ADDR'), :this_port_is_insecure)
s.handle(GismeteoServer)
s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
