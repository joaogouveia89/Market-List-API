module Api::V1
	class MarketListController < ApplicationController
		def add
			if check_token
				@item_id = params[:item_id]
				@item = Item.find(@item_id)
				@listItem = MarketList.new
				@listItem.item = @item
				if(@listItem.save)
					success
				else
					problem "Falha ao salvar"
				end
			else
				unauthorized
			end
		end

		def get_items
			if check_token
				@items_list = MarketList.all
				render :json => success_json.merge({
					result: JSON::parse(
						@items_list.to_json(
							:except => [:updated_at, :item_id],
							:include => [:item => {
									:except => [:created_at, :updated_at]
								}
							]
						)
					)
				}
			)
			else
				unauthorized
			end			
		end

		def delete_item
			if check_token
				@item_id = params[:item_id]
				if(MarketList.delete(@item_id))
					success
				else
					problem "Falha ao excluir"
				end
			else
				unauthorized
			end			
		end
	end
end