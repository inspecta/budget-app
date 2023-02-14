class ChangeColumnTypeInEntities < ActiveRecord::Migration[7.0]
  def change
    change_column :entities, :amount, :integer, using: 'amount::integer'
  end
end
