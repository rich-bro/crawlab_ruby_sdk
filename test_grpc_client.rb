PWD = File.expand_path("..", __FILE__)
require PWD + "/lib/crawlab_ruby_sdk.rb"

def main
	CrawlabRubySdk.save_item({name: "haha",age:12})

	CrawlabRubySdk.save_items([{name: "haha",age:12},{name:"456",age:34}])
end

main