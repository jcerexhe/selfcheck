class ChangeDataTypesInReflection < ActiveRecord::Migration
  def change
    remove_column :reflections, :feels, :string
    add_column :reflections, :feels, :integer, default: 0
    change_column :reflections, :body, :text
  end
end
