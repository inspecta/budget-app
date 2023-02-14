class CreateEntitiesGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :entities_groups, id: false do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
    end
    add_index :entities_groups, [:entity_id, :group_id], unique: true
  end
end
