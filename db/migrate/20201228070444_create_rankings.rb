class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.string :year_month
      t.references :prefecture, null: false, foreign_key: true
      t.integer :user1_id
      t.integer :user2_id
      t.integer :user3_id

      t.timestamps
    end
  end
end
