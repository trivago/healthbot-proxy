class SetupExtensions < ActiveRecord::Migration[5.1]
  def change
    enable_extension :citext
    enable_extension :pgcrypto
  end
end
