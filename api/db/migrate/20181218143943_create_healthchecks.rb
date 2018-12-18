class CreateHealthchecks < ActiveRecord::Migration[5.1]
  def change
    create_table :healthchecks, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
