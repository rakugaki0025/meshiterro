class CreatePostImages < ActiveRecord::Migration[6.1] # migrate
  def change
    create_table :post_images do |t|
       #         :テーブル名
      t.string :shop_name # t.データ型 :カラム名
      t.text :caption     # t.データ型 :カラム名
      t.integer :user_id  # t.データ型 :カラム名
      
      t.timestamps
    end
  end
end
