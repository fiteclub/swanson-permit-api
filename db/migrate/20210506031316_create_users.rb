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
      t.string :permit_num
      t.string :permit_issuer
      t.datetime :permit_expir
      t.string :permit_img

      t.timestamps
    end
  end
end
