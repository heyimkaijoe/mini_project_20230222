class CreateVisitHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_histories do |t|
      t.references :short_url, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
