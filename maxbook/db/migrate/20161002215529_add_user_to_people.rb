class AddUserToPeople < ActiveRecord::Migration[5.0]
  def change
    add_reference :people, :user, foreign_key: true
  end
end
