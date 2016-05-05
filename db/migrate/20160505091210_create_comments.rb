class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer  :article_id
      t.integer  :user_id
      t.datetime :created_at
    end
  end
end
