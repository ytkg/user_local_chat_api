# UserLocalChatApi

A Ruby wrapper of User Local API

## Installation

```ruby
gem 'user_local_chat_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install user_local_chat_api

## Usage

```ruby
gem 'user_local_chat_api'

client = UserLocalChatApi::Client.new('{access token}')

# 自動会話API
# ユーザー入力メッセージに対し、自然な受け答えを返す
p client.chat("こんにちは")
# => {
#      "status"=>"success",
#      "result"=>"こんにちはっ"
#    }

# キャラクター会話変換API
# ネコやイヌなどの語尾に自動変換する 例)愉快ですね→愉快だニャ
p client.character("ねむいな", "cat")
# => {
#      "status"=>"success",
#      "result"=>"ねむいニャ"
#    }

# 氏名自動識別API
# 会話中の相手の名前をもとに性別判定したり、姓・名を切り分ける
p client.name("田中太郎")
# => {
#      "status"=>"success",
#      "result"=>{
#        "last_name"=>"田中",
#        "last_name_yomi" = >"たなか",
#        "first_name"=>"太郎",
#        "first_name_yomi"=>"たろう",
#        "gender"=>1,
#        "gender_accuracy"=>4,
#        "nickname"=>[
#          "たろぴー",
#          "たろたん",
#          "たろちゃん",
#          "たろぽん",
#          "たなきち",
#          "たろたろー",
#          "たろすけ",
#          "たろべえ",
#          "たろっち",
#          "たーちゃ",
#          "太太郎"
#        ]
#      }
#    }

# 形態素解析API
# 文章を単語に分割・活用形抽出するAPI
p client.decompose("公園にキレイな花が咲いていました。")
# => {
#      "status"=>"success",
#      "result"=>[
#        { "surface"=>"公園", "pos"=>"名詞", "origin"=>"公園", "yomi"=>"コウエン" },
#        { "surface"=>"に", "pos"=>"助詞", "origin"=>"に", "yomi"=>"ニ" },
#        { "surface"=>"キレイ", "pos"=>"名詞", "origin"=>"キレイ", "yomi"=>"キレイ" },
#        { "surface"=>"な", "pos"=>"助動詞", "origin"=>"だ", "yomi"=>"ナ" },
#        { "surface"=>"花", "pos"=>"名詞", "origin"=>"花", "yomi"=>"ハナ" },
#        { "surface"=>"が", "pos"=>"助詞", "origin"=>"が", "yomi"=>"ガ" },
#        { "surface"=>"咲い", "pos"=>"動詞", "origin"=>"咲く", "yomi"=>"サイ" },
#        { "surface"=>"て", "pos"=>"助詞", "origin"=>"て", "yomi"=>"テ" },
#        { "surface"=>"い", "pos"=>"動詞", "origin"=>"いる", "yomi"=>"イ" },
#        { "surface"=>"まし", "pos"=>"助動詞", "origin"=>"ます", "yomi"=>"マシ" },
#        { "surface"=>"た", "pos"=>"助動詞", "origin"=>"た", "yomi"=>"タ" },
#        { "surface"=>"。", "pos"=>"記号", "origin"=>"。", "yomi"=>"。" }
#      ]
#    }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ytkg/user_local_chat_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
