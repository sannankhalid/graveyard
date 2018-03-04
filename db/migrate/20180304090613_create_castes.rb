class CreateCastes < ActiveRecord::Migration[5.1]
  def change
    create_table :castes do |t|
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end

