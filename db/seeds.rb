prefectures = [
  { name: '北海道', code: 1 },
  { name: '青森県', code: 2 },
  { name: '岩手県', code: 3 },
  { name: '宮城県', code: 4 },
  { name: '秋田県', code: 5 },
  { name: '山形県', code: 6 },
  { name: '福島県', code: 7 },
  { name: '茨城県', code: 8 },
  { name: '栃木県', code: 9 },
  { name: '群馬県', code: 10 },
  { name: '埼玉県', code: 11 },
  { name: '千葉県', code: 12 },
  { name: '東京都', code: 13 },
  { name: '神奈川県', code: 14 },
  { name: '新潟県', code: 15 },
  { name: '富山県', code: 16 },
  { name: '石川県', code: 17 },
  { name: '福井県', code: 18 },
  { name: '山梨県', code: 19 },
  { name: '長野県', code: 20 },
  { name: '岐阜県', code: 21 },
  { name: '静岡県', code: 22 },
  { name: '愛知県', code: 23 },
  { name: '三重県', code: 24 },
  { name: '滋賀県', code: 25 },
  { name: '京都府', code: 26 },
  { name: '大阪府', code: 27 },
  { name: '兵庫県', code: 28 },
  { name: '奈良県', code: 29 },
  { name: '和歌山県', code: 30 },
  { name: '鳥取県', code: 31 },
  { name: '島根県', code: 32 },
  { name: '岡山県', code: 33 },
  { name: '広島県', code: 34 },
  { name: '山口県', code: 35 },
  { name: '徳島県', code: 36 },
  { name: '香川県', code: 37 },
  { name: '愛媛県', code: 38 },
  { name: '高知県', code: 39 },
  { name: '福岡県', code: 40 },
  { name: '佐賀県', code: 41 },
  { name: '長崎県', code: 42 },
  { name: '熊本県', code: 43 },
  { name: '大分県', code: 44 },
  { name: '宮崎県', code: 45 },
  { name: '鹿児島県', code: 46 },
  { name: '沖縄県', code: 47 }
]

prefectures.each do |prefecture|
  Prefecture.create!(prefecture)
end

Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  name: ENV['ADMIN_NAME'],
  role: Admin.role.owner.value
)

def create_article(category, title, content_body)
  article = Article.new(
    category: category,
    title: title,
    status: Article.status.published.value,
    start_at: Time.zone.now + 1.day,
    end_at: Time.zone.now + 30.days
  )

  content = article.contents.build(body: content_body)

  if article.save
    puts "Article '#{title}' created successfully."
  else
    puts "Error creating Article '#{title}': #{article.errors.full_messages.join(', ')}"
  end
end
create_article(
  Article.category.event.value,
  'テクノロジーカンファレンス参加レポート',
  '先日、テクノロジーカンファレンスに参加しました。最新の技術トレンドについてのセッションがあり、特にAIと未来の展望について興味深い内容でした。また、業界のプロフェッショナルとネットワーキングする貴重な機会でもありました。参加者全体のエネルギーに感動し、次回も参加したいと思います.'
)

create_article(
  Article.category.company_trip.value,
  '夏の社員旅行での思い出',
  '今年の夏、社員旅行でリフレッシュしました。青い海と白い砂浜が広がるリゾート地で、チームビルディングの一環として様々なアクティビティに参加しました。特に印象に残ったのは、皆で協力して作った美味しいバーベキューです。夜はキャンプファイヤーで仕事の話から雑談まで、親睦を深める良い時間となりました.'
)

create_article(
  Article.category.staff_introduction.value,
  '新メンバー紹介：デザイナー加入！',
  '弊社に新しいデザイナーが仲間入りしました。彼はグラフィックデザインとユーザーエクスペリエンスに優れたスキルを持っています。これからのプロジェクトで彼のクリエイティビティと専門知識が弊社にどれだけ価値をもたらすか、楽しみで仕方ありません。一緒にプロジェクトを進めていくことができることを誇りに思います.'
)

create_article(
  Article.category.other.value,
  '季節の彩りサラダのレシピ',
  '今回は、新鮮な季節の野菜を使用した彩りサラダのレシピをご紹介します。カラフルな野菜が盛りだくさんで、見た目も美しく、栄養たっぷりです。ドレッシングはシンプルながらも爽やかな味わいで、ぜひお試しいただきたい一品です。お好みでハーブを加えてアレンジも可能です.'
)

def create_news(calendar_date, title, body)
  News.create!(
    calendar_date: calendar_date,
    title: title,
    status: News.status.published.value,
    start_at: Time.zone.now + 1.day,
    end_at: Time.zone.now + 30.days,
    body: body
  )
end

create_news(
  Time.zone.today,
  'システムアップデートのお知らせ',
  'お知らせ：システムのアップデート作業が予定されております。これに伴い、一時的なサービス停止が発生する可能性があります。ご利用の際はご注意ください。なお、アップデートの詳細については当社ウェブサイトをご確認ください。'
)

create_news(
  Time.zone.today - 2.days,
  '新イベントの開催決定！',
  'お知らせ：新しいイベントの開催が決定しました！「未来のテクノロジーに迫るセミナー」では、トップエキスパートが最新のテクノロジートレンドを紹介します。皆様のご参加をお待ちしております。詳細や申し込み方法については、イベントページをご覧ください。'
)

create_news(
  Time.zone.today - 1.day,
  '緊急メンテナンスのお知らせ',
  'お知らせ：緊急のシステムメンテナンスが予定されています。作業中は一時的なサービス停止が発生する可能性があります。ご迷惑をおかけいたしますが、ご理解とご協力をお願いいたします。なお、メンテナンスの詳細については当社ウェブサイトをご確認ください。'
)

create_news(
  Time.zone.today + 3.days,
  '新商品ラインナップが登場！',
  'お知らせ：新商品が豊富に入荷しました！今回のラインナップでは、お得なキャンペーンも実施中です。ぜひお早めにご覧いただき、お買い逃しのないようにご注意ください。'
)

def create_news(calendar_date, title, body)
  News.create!(
    calendar_date: calendar_date,
    title: title,
    status: News.status.published.value,
    start_at: Time.zone.now + 1.day,
    end_at: Time.zone.now + 30.days,
    body: body
  )
end


Shop.create!(
  name: '焼き鳥とおつまみ佐藤 野田店',
  postcode: '553-0006',
  prefecture_id: 27,
  city_name: '大阪市福島区',
  address: '吉野3丁目8-3',
  business_time: '月~金曜: 17時-23時L.O 23.30閉店\r\n土日: 12時-22時L.O 23時閉店',
  access: 'JR 福島駅から徒歩3分\r\n地下鉄 玉川駅から徒歩2分\r\n地下鉄 海老江駅から徒歩11分',
  phone_number: '06-6459-7396',
  counter_seat: 10,
  table_seat: 23,
  site_name: '食べログ',
  gourmet_site_link: 'https://tabelog.com/osaka/A2701/A270108/27131378/',
  shop_image: File.open(Rails.root.join('app/assets/images', 'default_shop_image.png')),
  google_map_iframe: 'place_id:ChIJEwbna0znAGARxPPVhfv--qc&key=AIzaSyBMnYsvSSlG2bIRomcwcLyRGxQgJYYw1YU',
)

Shop.create!(
  name: '焼き鳥とおつまみ佐藤 香里園店',
  postcode: '572-0085',
  prefecture_id: 27,
  city_name: '寝屋川市',
  address: '香里新町12-10ハヤトビル1F',
  business_time: '月曜日〜金曜日: 17時-23時（L.O 23.30）閉店\r\n土曜日・日曜日: 16時-23時（L.O 23.30）閉店',
  access: '京阪香里園駅から徒歩5分',
  phone_number: '072-813-4656',
  counter_seat: 10,
  table_seat: 30,
  site_name: '食べログ',
  gourmet_site_link: 'https://tabelog.com/osaka/A2707/A270702/27137569/',
  shop_image: File.open(Rails.root.join('app/assets/images', 'default_shop_image.png')),
  google_map_iframe: 'place_id:ChIJo6EP9XodAWARABKdkEI-Y8E&key=AIzaSyBMnYsvSSlG2bIRomcwcLyRGxQgJYYw1YU'
)

