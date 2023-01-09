class CreateMilestones < ActiveRecord::Migration[7.0]
  def change
    create_table :milestones do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
