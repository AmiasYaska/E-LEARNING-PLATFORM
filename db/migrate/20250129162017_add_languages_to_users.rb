class AddLanguagesToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :languages, :text, array: true, default: ["English"]
  end
end
