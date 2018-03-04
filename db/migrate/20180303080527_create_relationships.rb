class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.string :name
      t.boolean :is_active, default: true
      t.string :slug

      t.timestamps
    end
  end
end
