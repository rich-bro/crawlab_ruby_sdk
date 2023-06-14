class TaskServiceClient
	attr_accessor :address
	attr_accessor :auth

	def initialize(address,auth)
		@address = address
		@auth = auth
	end

    # 返回 TaskServiceSubscribeClient
	def subscribe
		stub = TaskServiceSubscribeClient.new(@address,@auth)
		return stub
	end
end