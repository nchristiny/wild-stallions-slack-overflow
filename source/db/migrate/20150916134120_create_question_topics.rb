class CreateQuestionTopics < ActiveRecord::Migration
  def change
    create_table :question_topics do |t|
      t.integer :topic_id, null: false
      t.integer :question_id, null: false
      
      t.timestamps null: false
    end
  end
end
