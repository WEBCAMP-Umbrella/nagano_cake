
# NAGANO CAKE
ケーキ販売のECサイト


# Dependency
+ ruby 2.5.7  
+ rails 5.2.4.2  
+ SQlite 3  
+ HTML5  
+ CSS3  
+ Gems  
  * Bootstrap4  
  * devise  
  * refile  
  * refile-mini_magick  
  * kaminari  
  * jquery-rails  
  * pry-rails  
  * font-awesome-sass  


# Setup
    $ git clone https://github.com/WEBCAMP-Ambrella/nagano_cake
    $ cd nagano_cake
    $ bundle install
    $ rails db:migrate
    $ rails s -b 0.0.0.0

○customer側  
<http://localhost:3000/><br /><br />

○admin側  

    $ rails console
    $ Admin.create!(email: 'admin@example.com', password: 'password')

で新規登録してから、  
<http://localhost:3000/admin>

# Usage
customer側とadmin側に分かれている  

+ customer(購入者)側  
  * 会員登録・編集・退会機能  
  * 商品の閲覧・カートに入れる・注文機能  
  * ジャンル検索・商品の検索機能  
  * 注文履歴の閲覧機能  
  * 商品のレビュー投稿・閲覧機能  
  * 人気ランキングの閲覧機能  
  * お気に入り追加機能、あなたへのおすすめ商品閲覧機能<br />

+ admin(管理者)側  
  * 商品の登録・編集機能  
  * 商品ジャンル登録・編集機能  
  * 会員一覧閲覧・編集機能  
  * 注文履歴一覧閲覧  
  * 注文の状態(入金待ち等)編集確認機能  
  * 注文の制作状態(制作中等)編集確認機能  


# References
+ cake.jp  
+ MoMA  
+ amazon  
+ 楽天  

# Authors
DMM webcamp  
Umbrellaチーム作成  


# License
This software is released under the Umbrella License, see LICENSE.


