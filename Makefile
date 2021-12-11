proto:
	grpc_tools_ruby_protoc -I . --ruby_out=./lib --grpc_out=./lib server.proto
