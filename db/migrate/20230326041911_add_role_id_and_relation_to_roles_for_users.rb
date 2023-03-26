class AddRoleIdAndRelationToRolesForUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :role, type: :integer, index: true
  end
end
