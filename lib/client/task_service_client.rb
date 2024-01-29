class TaskServiceClient
	attr_accessor :address
	attr_accessor :auth
	attr_accessor :use_gzip

	def initialize(address,auth,use_gzip=true)
		@address = address
		@auth = auth
		@use_gzip = use_gzip
	end

    # 返回 TaskServiceSubscribeClient
	def subscribe
		stub = TaskServiceSubscribeClient.new(@address,@auth,@use_gzip)
		return stub
	end
end