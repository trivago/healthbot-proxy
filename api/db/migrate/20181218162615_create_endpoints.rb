class CreateEndpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :endpoints, id: :uuid do |t|
      t.uuid :healthcheck_id, null: false
      t.string :remote_url, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_foreign_key :endpoints, :healthchecks, on_delete: :cascade
  end
end
