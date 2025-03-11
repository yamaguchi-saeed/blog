# Create categories
categories = ['技術', '旅行', '料理', 'ライフスタイル', '健康']
categories.each do |name|
  Category.create!(name: name)
end

# Create tags
tags =  ["学習", "投資", "健康", "仕事", "趣味", "旅行", "料理", "日記", "運動", "節約"];
tags.each do |name|
  Tag.create!(name: name)
end

# Create admin user
admin = User.create!(
  email: 'name@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# Create sample articles
articles = [
    {
        title: '一人旅におすすめの5つの旅行先',
        content: "一人旅は素晴らしい体験です。ここでは一人旅に最適な5つの旅行先をご紹介します...",
        category: Category.find_by(name: '旅行'),
        tags: [Tag.find_by(name: '旅行'), Tag.find_by(name: 'アドバイス')]
      },
      {
        title: '健康的な生活のための5つの習慣',
        content: "健康的な生活を送るためには、日常的に取り入れたい5つの習慣があります。ここではその実践方法を紹介します...",
        category: Category.find_by(name: '健康'),
        tags: [Tag.find_by(name: '健康'), Tag.find_by(name: '運動')]
      },
      {
        title: '投資の基本を学ぶ',
        content: "投資は将来のためにお金を増やすための方法です。この記事では、投資を始めるために必要な基本を紹介します...",
        category: Category.find_by(name: '投資'),
        tags: [Tag.find_by(name: '投資'), Tag.find_by(name: '節約')]
      }
]

articles.each do |article_data|
  article = Article.new(
    title: article_data[:title],
    content: article_data[:content],
    user: admin,
    category: article_data[:category]
  )
  article.tags << article_data[:tags]
  article.save!
end

puts "サンプルデータが正常に作成されました！"