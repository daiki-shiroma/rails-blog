class AddColumnComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :blog_id, :integer
    add_column :comments, :title, :string 
    add_column :comments, :contents, :text
  end
end
