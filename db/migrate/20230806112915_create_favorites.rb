class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :id             # t.データ型 :カラム名
      t.integer :user_id        # t.データ型 :カラム名
      t.integer :post_image_id  # t.データ型 :カラム名

      t.timestamps
    end
  end
end
