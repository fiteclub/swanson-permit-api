class CreateIds < ActiveRecord::Migration[6.0]
  def change
    create_table :ids do |t|
      t.references :user, null: false, foreign_key: true
      t.string :id_number
      t.string :state
      t.datetime :expiration

      t.timestamps
    end
  end
end
