# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: server.proto for package 'gismeteo'

require 'grpc'
require 'server_pb'

module Gismeteo
  module GismeteoWeatherGateway
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'gismeteo.GismeteoWeatherGateway'

      rpc :GetWeather, ::Gismeteo::Empty, ::Gismeteo::Weather
    end

    Stub = Service.rpc_stub_class
  end
end
