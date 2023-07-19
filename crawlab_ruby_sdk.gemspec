require_relative 'lib/crawlab_ruby_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "crawlab_ruby_sdk"
  spec.version       = CrawlabRubySdk::VERSION
  spec.authors       = ["min"]
  spec.email         = ["lijinmin3903@126.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/rich-bro/crawlab_ruby_sdk"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.add_dependency 'grpc','~> 1.55.0'
  spec.add_dependency 'google-protobuf','~> 3.23.2'
  spec.add_dependency 'json','~> 2.6.3'
  spec.add_dependency 'aliyun-sdk','~> 0.8.0'
  spec.add_dependency 'rest-client', '~> 2.1.0'
  spec.add_dependency 'nokogiri','~> 1.15.3'
  spec.add_dependency 'therubyracer','~> 0.12.3'
  spec.add_dependency 'faraday','~> 2.7.10'
  spec.add_dependency 'activesupport','~> 7.0.6'
  spec.add_dependency 'hpricot','~> 0.8.6'
  spec.add_dependency 'htmlentities','~> 4.3.4'

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rich-bro/crawlab_ruby_sdk"
  spec.metadata["changelog_uri"] = "https://github.com/rich-bro/crawlab_ruby_sdk"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
