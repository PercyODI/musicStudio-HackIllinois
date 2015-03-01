class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :primaryInstrument
      t.string :location

      t.timestamps
    end
  end
end
