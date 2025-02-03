class AddProgressToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :progress, :decimal, default: 0.0
  end
end
