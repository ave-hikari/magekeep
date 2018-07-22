class Picture < ApplicationRecord
  belongs_to :user

  # photoをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo,
    styles: { medium: "300x300>", thumb: "100x100>" },
    url: "/assets/arts/:id/:style/:basename.:extension",
    path: "#{Rails.root}/public/assets/arts/:id/:style/:basename.:extension" # サーバ上の画像保存先パス

  # ファイルの拡張子を指定
  validates_attachment :photo,
    presence: true,
    less_than: 5.megabytes, # ファイルサイズのチェック
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates :user_id, presence: true
  validates :description, length: { maximum: 200 }
end
