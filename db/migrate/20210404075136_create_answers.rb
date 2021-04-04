class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false, default: ""
      t.references :member, foreign_key: true, null: false, default: ""
      t.text    :content, null: false, default: ""
      t.boolean :best_answer, null: false, default: false

      t.timestamps
    end
  end
end
