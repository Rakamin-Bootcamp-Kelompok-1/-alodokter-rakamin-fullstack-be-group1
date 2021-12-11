class AddUserRefToPatients < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :user, foreign_key: true
  end
end
