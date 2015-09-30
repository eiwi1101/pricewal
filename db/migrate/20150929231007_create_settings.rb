class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :key
      t.text :value
      t.string :type
      t.string :group
    end
  end
end
