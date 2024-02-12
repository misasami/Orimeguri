class CreateKimonos < ActiveRecord::Migration[6.1]
  def change
    create_table :kimonos do |t|
      t.string :name
      t.string :genre
      t.text :about
      t.integer :user_id

      t.timestamps
    end
  end
end
