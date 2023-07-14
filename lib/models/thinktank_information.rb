class ThinktankInformation < BaseModel
	attr_accessor :id
	attr_accessor :title
	attr_accessor :site_name
	attr_accessor :site_name_cn
	attr_accessor :abstract
	attr_accessor :content
	attr_accessor :author_names
	attr_accessor :state_info
	attr_accessor :source
	attr_accessor :files
	attr_accessor :images
	attr_accessor :videos
	attr_accessor :audios
	attr_accessor :links
	attr_accessor :domain
	attr_accessor :keywords
	attr_accessor :html_content
	attr_accessor :lang
	attr_accessor :country_cn
	attr_accessor :country_code
	attr_accessor :created_at
	attr_accessor :updated_at
	attr_accessor :created_time
	attr_accessor :oss_files
	attr_accessor :oss_images
	attr_accessor :customer_category
	attr_accessor :category
	attr_accessor :topics
	attr_accessor :tags
	attr_accessor :views
	attr_accessor :comments
	attr_accessor :reference
	attr_accessor :mention_country
	attr_accessor :authors
	attr_accessor :sub_title
	attr_accessor :timezone
	attr_accessor :timezone_location
	attr_accessor :related_authors
	attr_accessor :related_author_names

	def self.table_name
		return "thinktank_informations"
	end
	register


	def initialize(options={})
		options = JSON.parse(options.to_json)
		@id = options["id"]
		@title = options["title"]
		@site_name = options["site_name"]
		@site_name_cn = options["site_name_cn"]
		@abstract = options["abstract"]
		@content = options["content"]
		@author_names = options["author_names"]
		@state_info = options["state_info"]
		@source = options["source"]
		@files = options["files"]
		@images = options["images"]
		@videos = options["videos"]
		@audios = options["audios"]
		@links = options["links"]
		@domain = options["domain"]
		@keywords = options["keywords"]
		@html_content = options["html_content"]
		@lang = options["lang"]
		@country_cn = options["country_cn"]
		@country_code = options["country_code"]
		@created_at = options["created_at"]
		@updated_at = options["updated_at"]
		@created_time = options["created_time"]
		@oss_files = options["oss_files"]
		@oss_images = options["oss_images"]
		@customer_category = options["customer_category"]
		@category = options["category"]
		@topics = options["topics"]
		@tags = options["tags"]
		@views = options["views"]
		@comments = options["comments"]
		@reference = options["reference"]
		@mention_country = options["mention_country"]
		@authors = options["authors"]
		@sub_title = options["sub_title"]
		@timezone = options["timezone"]
		@timezone_location = options["timezone_location"]
		@related_authors = options["related_authors"]
		@related_author_names = options["related_author_names"]		
	end

	def as_json
		return {
			id: @id,
			title: @title,
			site_name: @site_name,
			site_name_cn: @site_name_cn,
			abstract: @abstract,
			content: @content,
			author_names: @author_names,
			state_info: @state_info,
			source: @source,
			files: @files,
			images: @images,
			videos: @videos,
			audios: @audios,
			links: @links,
			domain: @domain,
			keywords: @keywords,
			html_content: @html_content,
			lang: @lang,
			country_cn: @country_cn,
			country_code: @country_code,
			created_at: @created_at,
			updated_at: @updated_at,
			created_time: @created_time,
			oss_files: @oss_files,
			oss_images: @oss_images,
			customer_category: @customer_category,
			category: @category,
			topics: @topics,
			tags: @tags,
			views: @views,
			comments: @comments,
			reference: @reference,
			mention_country: @mention_country,
			authors: @authors,
			sub_title: @sub_title,
			timezone: @timezone,
			timezone_location: @timezone_location,
			related_authors: @related_authors,
			related_author_names: @related_author_names,			

		}
	end

	def to_json
		return as_json.to_json
	end

	def self.verify_keys
		return {
			"id"=>            ["empty", "string"],
			"title"=>         ["empty", "string"],
			"site_name"=>     ["empty", "string"],
			"site_name_cn"=>  ["empty", "string"],
			"content"=>       ["empty", "string"],
			"source"=>        ["empty", "string"],
			"files"=>         ["json", "string"],
			"images"=>        ["json", "string"],
			"videos"=>        ["json", "string"],
			"audios"=>        ["json", "string"],
			"links"=>         ["json", "string"],
			"domain"=>        ["empty", "string"],
			"keywords"=>      ["json", "string"],
			"lang"=>          ["empty", "string"],
			"country_cn"=>    ["empty", "string"],
			"country_code"=>  ["empty", "string"],
			"created_at"=>    ["empty", "int", "length:13"],
			"updated_at"=>    ["empty", "int", "length:13"],
			"created_time"=>  ["empty", "int", "length:10"],
			"oss_files"=>     ["json", "string"],
			"oss_images"=>    ["json", "string"],
			"topics"=>        ["json", "string"],
			"tags"=>          ["string", "json"],
			"authors"=>       ["json", "fields:author_id,author_name,author_url", "string"],
			"timezone"=>      ["empty", 'regex:[\+|-]\d{4}', "string"],
			"timezone_location"=> ["empty", "string"],	
			"related_authors" => ["json","string"],
		}
	end	
end