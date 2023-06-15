require 'aliyun/oss'

class OssServerClient
	attr_accessor :oss_client
	attr_accessor :bucket

	def initialize
		get_oss_client
		get_bucket
	end

	def get_oss_client
		endpoint = ENV["CRAWLAB_OSS_ENDPOINT"]
		access_key_id = ENV["CRAWLAB_OSS_ACCESS_KEY"]
		access_key_secret = ENV["CRAWLAB_OSS_SECRET"]
		bucket = ENV["CRAWLAB_OSS_BUCKET"]
		if endpoint == nil || endpoint == ""
			return
		end
		if access_key_id == nil || access_key_id == ""
			return
		end
		if access_key_secret == nil || access_key_secret == ""
			return
		end

		if bucket == nil || bucket == ""
			return
		end
		@oss_client = Aliyun::OSS::Client.new(
		  :endpoint => endpoint,
		  :access_key_id => access_key_id,
		:access_key_secret => access_key_secret)		
	end

	def get_bucket
		bucket = ENV["CRAWLAB_OSS_BUCKET"]
		if bucket == nil || bucket == ""
			return
		end
		@bucket = @oss_client.get_bucket(bucket)
	end

	def send(oss_path,file_path)
		if bucket == nil || @oss_client == nil
			return "bucket is nil"
		end
		bucket.put_object(oss_path, :file => file_path)

		bucket_url = bucket.object_url(oss_path)
		return bucket_url
	end

	def send_stream(oss_path,stream)
		bucket.put_object(oss_path){ |a| a << stream }

		bucket_url = bucket.object_url(oss_path)
		return bucket_url		
	end
end