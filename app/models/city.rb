class City < ApplicationRecord
  belongs_to :pref
  has_many :city_topics, dependent: :destroy

  validates :city_name, presence: true, length: { maximum: 50 }

  #importメソッド
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つからなければ、新しく作成
      city = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      city.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      city.save
    end
  end
  
  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "city_name", "city_code", "pref_id"]
  end
end
