class RemoveContentsFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :contents, :text
  end
end
