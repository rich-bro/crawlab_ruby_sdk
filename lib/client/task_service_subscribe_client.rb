class TaskServiceSubscribeClient
	attr_accessor :stub
	attr_accessor :metadata

	def initialize(address,auth)
		@stub = GRPC::ClientStub.new(address,:this_channel_is_insecure)
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

		return Grpc::StreamMessage.decode(obj)
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