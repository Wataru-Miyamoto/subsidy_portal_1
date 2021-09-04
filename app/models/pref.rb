class Pref < ApplicationRecord
  has_many :pref_topics, dependent: :destroy
  has_many :cities, dependent: :destroy

  validates :pref_name, presence: true, length: { maximum: 50 }

  #importメソッド
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つからなければ、新しく作成
      pref = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      pref.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      pref.save
    end
  end
  
  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "pref_name", "pref_code"]
  end
end
