# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: server.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("server.proto", :syntax => :proto3) do
    add_message "gismeteo.Weather" do
      optional :info, :string, 1
    end
    add_message "gismeteo.Empty" do
    end
  end
end

module Gismeteo
  Weather = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gismeteo.Weather").msgclass
  Empty = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gismeteo.Empty").msgclass
end