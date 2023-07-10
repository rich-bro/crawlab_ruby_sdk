require 'json'

$map_models = {}
class BaseModel
	def self.table_name
		return ""
	end

	def self.register
		$map_models[table_name]  = self.name
	end

	def self.fields
		JSON.parse(self.new({}).as_json.to_json).keys
	end

	def as_json
		{}
	end
end