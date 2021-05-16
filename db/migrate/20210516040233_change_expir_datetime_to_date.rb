class ChangeExpirDatetimeToDate < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      t.change :ident_expir, :date
      t.change :recom_expir, :date
    end
  end

  def down
    change_table :users do |t|
      t.change :ident_expir, :datetime
      t.change :recom_expir, :datetime
    end
  end
end
