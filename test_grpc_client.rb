

require 'crawlab_ruby_sdk'
require 'rest-client'
def main
	CrawlabRubySdk.save_item({name: "haha",age:12})

	CrawlabRubySdk.save_items([{name: "haha",age:12},{name:"456",age:34}])
	ENV.each do |k,v|
		puts "#{k}=#{v}"
	end

	oss_path = "thinkthank_files/files/1123123123.pdf"
	file_path = "/home/min/Downloads/RAND_RRA1218-2.pdf"
	bucket_url = CrawlabRubySdk.save_file_to_oss(oss_path,file_path)
	puts bucket_url

	oss_path = "thinkthank_files/files/456.pdf"
	res = RestClient.get("https://www.rand.org/content/dam/rand/pubs/research_reports/RRA1200/RRA1218-2/RAND_RRA1218-2.pdf")
	stream = res.body
	bucket_url = CrawlabRubySdk.save_file_stream_to_oss(oss_path,stream)
	puts bucket_url	


	# endpoint = ENV["CRAWLAB_OSS_ENDPOINT"] = ""
	# access_key_id = ENV["CRAWLAB_OSS_ACCESS_KEY"] = ""
	# access_key_secret = ENV["CRAWLAB_OSS_SECRET"] = ""
	# bucket = ENV["CRAWLAB_OSS_BUCKET"] = ""

	a = OssServerClient.new

	a.bucket.get_object("thinkthank_files/files/789.pdf", :file => "/home/min/Downloads/2-2.pdf")

end

main