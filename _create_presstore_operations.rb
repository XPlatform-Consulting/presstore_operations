class CreatePresstoreOperations < ActiveRecord::Migration
  def self.up
    create_table :action_presstore_operations do |t|
      t.string :name
      t.text :comments

      t.string :execution_node
      t.string :operation
      t.string :execution_login
      t.string :execution_password
      t.string :binary_path

      t.timestamps
    end
  end

  def self.down
    drop_table :action_presstore_operations
  end
end
