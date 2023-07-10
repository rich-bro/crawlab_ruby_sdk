class Verify
	def self.IsVerified?(itmes=[],table_name="")

		if table_name == "" && len(items) > 0
			switch_table(items[0])
		end

		return true
	end

	def switch_table(item={})
		puts $map_models
	end

end
