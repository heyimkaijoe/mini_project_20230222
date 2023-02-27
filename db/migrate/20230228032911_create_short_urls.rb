class CreateShortUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :short_urls do |t|
      t.string :code
      t.string :full_url
      t.integer :click_count

      t.timestamps
    end
  end
end
