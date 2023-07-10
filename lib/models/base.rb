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
						if !verify_empty(value)
							puts "ERROR: #{key} cannot be empty!"
							return false
						end
					elsif fn == "json"
						if !verify_json(value)
							puts "ERROR: #{key} json string parse fail!"
							return false
						end
					elsif fn == "string"
						if !verify_string(value)
							puts "ERROR: #{key} field type is not string!"
							return false
						end
					elsif fn == "int"
						if !verify_int(value)
							puts "ERROR: #{key} field type is not int!"
							return false
						end
					elsif fn.include?("regex")
						if !verify_regex(fn,value)
							puts "ERROR: #{key} regex #{fn} match error"
							return false
						end
					elsif fn.include?("length")
						if !verify_length(fn,value)
							puts "ERROR: #{key} length must be #{fn}"
							return false
						end
					elsif fn.include?("fields")
						if !verify_fields(fn,value)
							puts "ERROR: #{key}:#{fn} not Exist!"
							return false
						end
					end
				end
			end
		end
	end

	def verify_empty(v)
		if v == nil || v == "" 
			return false
		end
		return true
	end

	def verify_json(v)
		begin
			JSON.parse(v)
			return true
		rescue StandardError => e
			return false
		end
		return true
	end

	def verify_string(v)
		if v == nil
			return false
		end
		if v.class.name == "String"
			return true
		end
		return false
	end

	def verify_int(v)
		if v == nil
			return false
		end

		if  v.class.name == "Integer"
			return true
		end
		return false
	end

	def verify_regex(fn,v)
		if fn.class.name != "String"
			return false
		end		
		regex_arr = fn.split(":")
		if regex_arr.size < 2
			return false
		end
		regex_str = regex_arr[1]
		if regex_str.size == 0
			return false
		end

		if v == nil || v == ""
			return false
		end

		if v =~ Regexp.new(regex_str)
		  return true
		else
			return false
		end
	end

	def verify_length(fn,v)
		if fn.class.name != "String"
			return false
		end		
		length_arr = fn.split(":")
		if length_arr.size < 2
			return false
		end
		length = length_arr[1].to_i
		if length == 0
			return false
		end		

		if v == nil
			return false
		end

		if v.to_s.size == length
			return true
		end

		return false
	end

	def verify_fields(fn,v)
		if fn.class.name != "String"
			return false
		end		
		fields_arr = fn.split(":")
		if length_arr.size < 2
			return false
		end
		fields_str = fields_arr[1]

		fields = fields_str.split(",")

		begin
			datas = json.parse(v)
			datas.each do |data|
				fields.each do |field|
					if data[field] == nil
						return false
					end
				end
			end
		rescue StandardError => e
			return false
		end

		return true
	end


end