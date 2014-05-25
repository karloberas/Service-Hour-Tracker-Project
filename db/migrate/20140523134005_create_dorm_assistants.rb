class CreateDormAssistants < ActiveRecord::Migration
  def change
    create_table :dorm_assistants do |t|
      t.string :name
      t.integer :id_num
      t.integer :year
      t.string :course
      t.string :room
      t.string :scholarship_type
      t.integer :num_hours
      t.integer :hours_rendered

      t.timestamps
    end
  end
end
