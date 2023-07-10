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

	def self.verify_keys
		return {}
	end

	def as_json
		{}
	end

	def verify
		json_data = as_json
		verify_keys = self.class.verify_keys

		verify_keys.each do |key,fns|
			value = json_data[key.to_sym]
			if fns.class.name == "Array"
				fns.each do |fn|
					if fn == "empty"
					elsif fn == "json"
					elsif fn == "string"
					elsif fn == "int"
					elsif fn.include?("regex")
					elsif fn.include?("length")
					elsif fn.include?("fields")
					
					end
				end
			end
		end
	end

	def verify_empty(v)
		
	end


end