class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :rec_number
      t.string :issuer
      t.string :state
      t.datetime :expiration

      t.timestamps
    end
  end
end
