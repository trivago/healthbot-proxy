class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings, id: :uuid do |t|
      t.uuid :endpoint_id, null: false
      t.integer :status, default: 0
      t.text :response

      t.timestamps
    end

    add_foreign_key :pings, :endpoints, on_delete: :cascade
  end
end
