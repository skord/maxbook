class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :avatar

      t.timestamps
    end
  end
end
