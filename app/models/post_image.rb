class PostImage < ApplicationRecord
    
  has_one_attached :image
   #
  belongs_to :user
   # ユーザーに属する 1:N の関係 [N]
  
  def get_image
       # ActiveStorageに格納したno_image画像(D)を表示する
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  
    
end
