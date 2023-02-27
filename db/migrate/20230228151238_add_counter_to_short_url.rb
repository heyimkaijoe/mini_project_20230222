class AddCounterToShortUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :short_urls, :visit_histories_count, :integer
  end
end
