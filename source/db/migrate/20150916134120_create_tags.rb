class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :topic_id, null: false
      t.integer :question_id, null: false
      
      t.timestamps null: false
    end
  end
end
