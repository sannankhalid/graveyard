class CreateGraves < ActiveRecord::Migration[5.1]
  def change
    create_table :graves do |t|
      t.string :name
      t.integer :relationship_id
      t.string :relationship_name
      t.integer :gender
      t.datetime :died_at
      t.integer :age
      t.string :number
      t.integer :created_by_id
      t.integer :updated_by_id, null: true

      t.timestamps
    end
  end
end
