class ChangeDobDatetimeToDate < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      t.change :dob, :date
    end
  end

  def down
    change_table :users do |t|
      t.change :dob, :datetime
    end
  end
end
