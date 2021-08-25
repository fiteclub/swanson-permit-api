class ChangeExpirDatetimeToDate < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      t.change :ident_expir, :date
      t.change :permit_expir, :date
    end
  end

  def down
    change_table :users do |t|
      t.change :ident_expir, :datetime
      t.change :permit_expir, :datetime
    end
  end
end
