class ThinktankExpert < BaseModel
	attr_accessor :id
	attr_accessor :name
	attr_accessor :title
	attr_accessor :content
	attr_accessor :location
	attr_accessor :area_of_expertise
	attr_accessor :profile_images
	attr_accessor :phone
	attr_accessor :email
	attr_accessor :link
	attr_accessor :audios
	attr_accessor :videos
	attr_accessor :education
	attr_accessor :related_topics
	attr_accessor :site_name
	attr_accessor :site_name_cn
	attr_accessor :domain
	attr_accessor :created_at
	attr_accessor :updated_at
	attr_accessor :source
	attr_accessor :oss_profile_images
	attr_accessor :facebook
	attr_accessor :twitter
	attr_accessor :linkedin
	attr_accessor :instagram
	attr_accessor :wikidata
	attr_accessor :person_type
	attr_accessor :files
	attr_accessor :oss_files
	attr_accessor :associated_program
	attr_accessor :lang
	attr_accessor :website
	attr_accessor :nationalities


	def self.table_name
		return "thinktank_experts"
	end	
	register
	

	def initialize(options={})
		options = JSON.parse(options.to_json)
		@id = options["id"]
		@name = options["name"]
		@title = options["title"]
		@content = options["content"]
		@location = options["location"]
		@area_of_expertise = options["area_of_expertise"]
		@profile_images = options["profile_images"]
		@phone = options["phone"]
		@email = options["email"]
		@link = options["link"]
		@audios = options["audios"]
		@videos = options["videos"]
		@education = options["education"]
		@related_topics = options["related_topics"]
		@site_name = options["site_name"]
		@site_name_cn = options["site_name_cn"]
		@domain = options["domain"]
		@created_at = options["created_at"]
		@updated_at = options["updated_at"]
		@source = options["source"]
		@oss_profile_images = options["oss_profile_images"]
		@facebook = options["facebook"]
		@twitter = options["twitter"]
		@linkedin = options["linkedin"]
		@instagram = options["instagram"]
		@wikidata = options["wikidata"]
		@person_type = options["person_type"]
		@files = options["files"]
		@oss_files = options["oss_files"]
		@associated_program = options["associated_program"]
		@lang = options["lang"]
		@website = options["website"]
		@nationalities = options["nationalities"]
	end

	def as_json
		return {
			id: @id,
			name: @name,
			title: @title,
			content: @content,
			location: @location,
			area_of_expertise: @area_of_expertise,
			profile_images: @profile_images,
			phone: @phone,
			email: @email,
			link: @link,
			audios: @audios,
			videos: @videos,
			education: @education,
			related_topics: @related_topics,
			site_name: @site_name,
			site_name_cn: @site_name_cn,
			domain: @domain,
			created_at: @created_at,
			updated_at: @updated_at,
			source: @source,
			oss_profile_images: @oss_profile_images,
			facebook: @facebook,
			twitter: @twitter,
			linkedin: @linkedin,
			instagram: @instagram,
			wikidata: @wikidata,
			person_type: @person_type,
			files: @files,
			oss_files: @oss_files,
			associated_program: @associated_program,
			lang: @lang,
			website: @website,
			nationalities: @nationalities,
		}
	end

	def to_json
		return as_json.to_json
	end

	def self.verify_keys
		return {
			"id"=>          ["empty", "string"],
			"title"=>       ["json", "string"],
			"name"=>        ["empty", "string"],
			"site_name_cn"=>["empty", "string"],
			"site_name"=>   ["empty", "string"],
			"source"=>      ["empty", "string"],
			"audios"=>      ["json", "string"],
			"videos"=>      ["json", "string"],
			"related_topics"=>["json", "string"],
			"files"=>       ["json", "string"],
			"oss_files"=>   ["json", "string"],
			"domain"=>      ["empty", "string"],
			"created_at"=>  ["empty", "int", "length:13"],
			"updated_at"=>  ["empty", "int", "length:13"],		
			"area_of_expertise" => ["json", "string"],	
		}
	end
end