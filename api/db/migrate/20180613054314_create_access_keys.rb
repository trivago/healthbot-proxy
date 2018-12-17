class CreateAccessKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :access_keys, id: :uuid do |t|
      t.string :token, null: false
      t.boolean :active, null: false, default: false
      t.string :description

      t.timestamps
    end

    add_index :access_keys, :token, unique: true
  end
end
