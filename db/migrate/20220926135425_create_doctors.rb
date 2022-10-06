class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :speciality
      t.float :bill
      t.string :avatar
      t.string :location
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
