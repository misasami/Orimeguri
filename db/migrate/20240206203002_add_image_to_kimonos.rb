class AddImageToKimonos < ActiveRecord::Migration[6.1]
  def change
    add_column :kimonos, :image, :string
  end
end
