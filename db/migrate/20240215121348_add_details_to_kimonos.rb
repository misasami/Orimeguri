class AddDetailsToKimonos < ActiveRecord::Migration[6.1]
  def change
    add_column :kimonos, :lat, :float
    add_column :kimonos, :lng, :float
  end
end
