class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookmarkable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
