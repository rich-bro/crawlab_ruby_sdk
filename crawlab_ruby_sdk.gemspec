require_relative 'lib/crawlab_ruby_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "crawlab_ruby_sdk"
  spec.version       = CrawlabRubySdk::VERSION
  spec.authors       = ["min"]
  spec.email         = ["lijinmin3903@126.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://rubygems.org/lijinmin3903/crawlab_ruby_sdk"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/lijinmin3903/crawlab_ruby_sdk"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://rubygems.org/lijinmin3903/crawlab_ruby_sdk"
  spec.metadata["changelog_uri"] = "https://rubygems.org/lijinmin3903/crawlab_ruby_sdk"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
