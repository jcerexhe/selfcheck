class RenameTypeInReflection < ActiveRecord::Migration
  def change
    rename_column :reflections, :type, :entry_type
  end
end
