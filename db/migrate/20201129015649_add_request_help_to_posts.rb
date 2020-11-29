class AddRequestHelpToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :request_help, :boolean, default: false, null: false
  end
end
