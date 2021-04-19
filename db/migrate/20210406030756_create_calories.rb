class CreateCalories < ActiveRecord::Migration[6.1]
  def change
    create_table :calories do |t|
      t.integer :recipes_id
      t.string :name
      t.integer :calorie

      
    end
  end
end
