class AddGenreIdToKimonos < ActiveRecord::Migration[6.1]
  def change
    add_column :kimonos, :genre_id, :integer
  end
end
