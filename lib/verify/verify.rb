class Verify
	def self.IsVerified?(items=[],table_name="")

		if table_name == "" && items.size > 0
			table_name = switch_table(items[0])
		end

		if table_name == ""
			puts "未匹配，不验证"
		else
			puts "验证：#{table_name}"
		end

		if table_name != ""
			kclass = Object.const_get $map_models[table_name]

			if kclass == nil
				puts "ERROR #{table_name} 验证 not Exist!"
				return true
			end

			items.each do |item|
				if !kclass.new(item).verify
					return false
				end
			end			
		end


		return true
	end

	def self.switch_table(item={})
		table_name = ""

		item_keys = JSON.parse(item.to_json).keys
		# puts "----#{item_keys}--"

		$map_models.each do |k,v|
			klass = Object.const_get v
			klass_keys = klass.fields

			# puts "----#{klass_keys}--"
			sub_keys = item_keys - klass_keys
			if sub_keys.size == 0 && item_keys.size == klass_keys.size
				return k
			end
		end

		return table_name
	end

end
