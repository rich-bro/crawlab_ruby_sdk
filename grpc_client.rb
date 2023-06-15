PWD = File.expand_path("..", __FILE__)
require PWD + "/lib/crawlab_ruby_sdk.rb"

def main
	CrawlabRubySdk.save_item({})
end