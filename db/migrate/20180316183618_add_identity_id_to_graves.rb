class AddIdentityIdToGraves < ActiveRecord::Migration[5.1]
  def change
    add_column :graves, :identity_id, :integer
  end
end
