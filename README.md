# CrawlabRubySdk

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/crawlab_ruby_sdk`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crawlab_ruby_sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install crawlab_ruby_sdk

## Usage

```
    CrawlabRubySdk.save_item({name: "haha",age:12})

    CrawlabRubySdk.save_items([{name: "haha",age:12},{name:"456",age:34}])

    oss_path = "thinkthank_files/files/1123123123.pdf"
    file_path = "/home/min/Downloads/RAND_RRA1218-2.pdf"
    bucket_url = CrawlabRubySdk.save_file_to_oss(oss_path,file_path)
    puts bucket_url

    oss_path = "thinkthank_files/files/456.pdf"
    res = RestClient.get("https://www.rand.org/content/dam/rand/pubs/research_reports/RRA1200/RRA1218-2/RAND_RRA1218-2.pdf")
    stream = res.body
    bucket_url = CrawlabRubySdk.save_file_stream_to_oss(oss_path,stream)
    puts bucket_url 
```

##### 字段验证规则

```
 CrawlabRubySdk.save_item({name: "haha",age:12},table_name)
 CrawlabRubySdk.save_items([{name: "haha",age:12},{name:"456",age:34}],table_name)
 table_name 可以是这几个["thinktank_expert_reports", "thinktank_informations", "thinktank_experts", "thinktank_reports"] 中的一个,也可以不传递

 1、如果当前采集的结果 存储的数据表是上面几个中的一个，无论是否传递，都会按照对应的表结构的 字段规则验证字段
 2、如果当前采集的结果，存储的数据表不属于上面几个中的一个，则按照传递传递的table_name，对应的字段规则验证字段
 3、如果没有传递table_name,并且采集的结果存储临时表，则根据推送的结果的字段匹配 上面四个表的字段，匹配上了就按照匹配上的表结构的字段规则验证，没有匹配上则不验证
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/crawlab_ruby_sdk.

**bundle gem crawlab_ruby_sdk.gemspec**
**添加代码**
**gem build**
**gem install --local crawlab_ruby_sdk-0.2.5.gem**

curl -u ***** https://rubygems.org/api/v1/api_key.yaml # ***** 为你的用户名

$ rake -T
rake build    # Build blomming_api-0.3.7.gem into the pkg directory
rake install  # Build and install blomming_api-0.3.7.gem into system gems
rake release  # Create tag v0.3.7 and build and push blomming_api-0.3.7.gem to Rubygems


