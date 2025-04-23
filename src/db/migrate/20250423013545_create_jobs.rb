class CreateJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :salary
      t.integer :company_id
      t.text :requirements
      t.text :benefits
      t.string :employment_type

      t.timestamps
    end
  end
end
