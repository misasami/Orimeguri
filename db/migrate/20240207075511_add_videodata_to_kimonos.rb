class AddVideodataToKimonos < ActiveRecord::Migration[6.1]
  def change
    add_column :kimonos, :videodata, :text
  end
end
