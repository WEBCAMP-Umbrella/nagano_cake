
# H1 NAGANO CAKE
ケーキ販売のECサイト


# H1 Dependency
*ruby 2.5.7
*rails 5.2.4.2
*SQlite 3
*HTML5
*CSS3
*Gems
   *Bootstrap4
   *devise
   *refile
   *refile-mini_magick
   *kaminari
   *jquery-rails
   *pry-rails
   *font-awesome-sass


# H1 Setup
    $ git clone https://github.com/WEBCAMP-Ambrella/nagano_cake
    $ cd nagano_cake
    $ bundle install
    $ rails db:migrate
    $ rails s -b 0.0.0.0

*customer側
<http://localhost:3000/>
*admin側
<http://localhost:3000/admin>から
メールアドレス
パスワード
でログインして下さい


# H1 Usage
customer側とadmin側に分かれて使用する

*customer(購入者)側
会員登録・編集・退会機能
商品の閲覧・カートに入れる・注文機能
ジャンル検索・商品の検索機能
注文履歴の閲覧機能
商品のレビュー投稿・閲覧機能
人気ランキングの閲覧機能
お気に入り追加機能、あなたへのおすすめ商品機能

*admin(管理者)側
商品の登録・編集機能
商品ジャンル登録・編集機能
会員一覧閲覧・編集機能
注文履歴一覧閲覧
注文の状態(入金待ち等)確認機能
注文の制作状態(制作中等)編集機能


# H1 References
cake.jp
MoMA
amazon
楽天

# H1 Authors
DMM webcamp
Umbrellaチーム作成


# H1 License
This software is released under the Umbrella License, see LICENSE.


