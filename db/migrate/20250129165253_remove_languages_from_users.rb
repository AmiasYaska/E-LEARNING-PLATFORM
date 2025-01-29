class RemoveLanguagesFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :languages, :text, array: true, default: ["English"]
  end
end
