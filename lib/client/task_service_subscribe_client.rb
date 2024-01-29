class TaskServiceSubscribeClient
	attr_accessor :stub
	attr_accessor :metadata

	def initialize(address,auth,use_gzip=true)
		compression_options =
      GRPC::Core::CompressionOptions.new(default_algorithm: :gzip,default_level: :high)
    compression_channel_args = compression_options.to_channel_arg_hash
    if !use_gzip
    	compression_channel_args = {}
    end
		@stub = GRPC::ClientStub.new(address,:this_channel_is_insecure,channel_args:compression_channel_args)
		@metadata = {"authorization": auth}

	end

	def Send(streamMessage)
		@stub.client_streamer("/grpc.TaskService/Subscribe", streamMessage, method(:marshal), method(:unmarshal),metadata: @metadata)
	end


	def marshal(obj)
	# 	a = {
	# 		code: obj.code,
	# 		node_key: obj.node_key,
	# 		key: obj.key,
	# 		from: obj.from,
	# 		to: obj.to,
	# 		data: obj.data,
	# 		error: obj.error,
	# 	}

       # return a.to_json
       return Grpc::StreamMessage.encode(obj)
	end

	def unmarshal(str)
		# a = JSON.parse(str)

		# obj = StreamMessage.new(a)
		# return obj

		return Grpc::StreamMessage.decode(str)
	end

	def each
		
	end

	def test_send(streamMessage)
		test_a(method(:marshal),streamMessage)
	end

	def test_a(bbb,streamMessage)
		a = bbb.call(streamMessage)
		puts a
	end
end