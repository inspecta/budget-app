class AddIconDataToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :icon_data, :text
  end
end
