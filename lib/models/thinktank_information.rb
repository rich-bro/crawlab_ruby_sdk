class ThinktankInformation
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

	def self.table_name
		return "thinktank_informations"
	end
	def initialize(options={})
		
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
			timezone_location: @timezone_location

		}
	end

	def to_json
		return as_json.to_json
	end
end