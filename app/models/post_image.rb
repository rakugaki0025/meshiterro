class PostImage < ApplicationRecord # models
  
  
  belongs_to :user
        # ユーザーに属する 1:N の関係 [N]
        
  has_one_attached :image
        # 
        
  has_many :post_comments, dependent: :destroy
        # メソッド 1:N の関係性 [1] 削除後N全 (アソシエーション）
        # post_comments 1:N の関係 postImageモデル = PostCommentモデル
        
  has_many :favorites, dependent: :destroy
        # メソッド 1:N の関係性 [1] 削除後N全 (アソシエーション）
        # favorites 1:N の関係 postImageモデル = PostCommentモデル
  
  
  validates :shop_name, presence: true
        #shop_nameが存在しているかを確認するバリデーション
        
  validates :image, presence: true
        #imageが存在しているかを確認するバリデーション
  
        
  def favorited_by?(user)
        # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するか
        # 存在していればtrue、存在していなければfalseを返す
        
      favorites.exists?(user_id: user.id)
        # 
        
  end
  
  
  def get_image
        # ActiveStorageに格納したno_image画像(D)を表示する
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
        # サンプル画像を載せる記述
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        #
    end
      image
        # 記述がないと目的を果たせない(画像)get_image依存
  end
  
  
    
end
