class AddDefaultToVisitCount < ActiveRecord::Migration[7.0]
  def change
    change_column_default :short_urls, :click_count, 0 
  end
end
