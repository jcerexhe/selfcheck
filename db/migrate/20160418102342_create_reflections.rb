class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.references :user, index: true, foreign_key: true
      t.string :type
      t.string :feels
      t.string :body
      t.string :ip_address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
