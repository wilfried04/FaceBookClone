class AddColumnsToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :content, :string
  end
end
