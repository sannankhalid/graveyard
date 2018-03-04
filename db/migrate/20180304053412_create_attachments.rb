class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.integer :created_by_id
      t.integer :updated_by_id, null: true
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end
end
