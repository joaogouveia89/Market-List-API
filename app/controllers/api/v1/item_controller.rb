module Api::V1
	class ItemController < ApplicationController
		def addItem
			if check_token
				@name = params[:name]
				@item_type = params[:item_type]
				unless @name.empty?
					@item = Item.new
					@item.name = @name.downcase
					@item.item_type = @item_type
					if(@item.save)
						success
					else
						fail_to_save "Falha ao salvar"
					end
				end
			else
				unauthorized
			end
		end

		def getItem
			if check_token
				@query = params[:query]
				@query = @query.downcase
				@result = Item.where("name like ?", "#{@query}%")
				render :json => success_json.merge({
					result: JSON::parse(@result.to_json)
				})
			else
				unauthorized
			end			
		end
	end
end