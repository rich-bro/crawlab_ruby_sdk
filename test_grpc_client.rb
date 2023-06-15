PWD = File.expand_path("..", __FILE__)
require PWD + "/lib/crawlab_ruby_sdk.rb"

def main
	# CrawlabRubySdk.save_item({name: "haha",age:12})

	# CrawlabRubySdk.save_items([{name: "haha",age:12},{name:"456",age:34}])


	oss_path = "thinkthank_files/files/1123123123.pdf"
	file_path = "/home/min/Downloads/RAND_RRA1218-2.pdf"
	bucket_url = CrawlabRubySdk.save_file_to_oss(oss_path,file_path)
	puts bucket_url
end

main