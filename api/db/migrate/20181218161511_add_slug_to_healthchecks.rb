class AddSlugToHealthchecks < ActiveRecord::Migration[5.1]
  def change
    add_column :healthchecks, :slug, :citext
    add_index :healthchecks, :slug, unique: true
  end
end
