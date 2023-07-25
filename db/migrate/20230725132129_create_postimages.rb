class CreatePostimages < ActiveRecord::Migration[6.1]
  def change
    create_table :postimages do |t|
        #         :テーブル名
      t.string :title # t.データ型 :カラム名
      t.string :body  # t.データ型 :カラム名
      
      t.timestamps
    end
  end
end
