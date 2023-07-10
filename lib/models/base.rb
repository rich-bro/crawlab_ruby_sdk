# require 'thinktank_expert'
# map_models = {
# 	ThinktankExpert.table_name => {kclass: ThinktankExpert,keys:[]},
# 	ThinktankExpertReport.table_name => {kclass: ThinktankExpertReport,keys:[]},
# 	ThinktankInformation.table_name => {kclass: ThinktankInformation,keys:[]},
# 	ThinktankReport.table_name => {kclass: ThinktankReport,keys:[]},
# }
$map_models = {}
class BaseModel
	def self.table_name
		return ""
	end

	def self.register
		$map_models[table_name]  = self.name
	end

	def self.fields
		self.new({}).as_json.keys
	end

	def as_json
		{}
	end
end