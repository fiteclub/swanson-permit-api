class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :dob
      t.string :ident_num
      t.string :ident_state
      t.datetime :ident_expir
      t.string :ident_img
      t.string :recom_num
      t.string :recom_issuer
      t.datetime :recom_expir
      t.string :recom_img

      t.timestamps
    end
  end
end
