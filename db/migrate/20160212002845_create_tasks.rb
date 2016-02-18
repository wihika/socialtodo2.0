class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :owner
      t.string :collaborator1
      t.string :collaborator2
      t.string :collaborator3
      t.boolean :done

      t.timestamps null: false
    end
  end
end
