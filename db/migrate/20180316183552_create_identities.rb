class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
