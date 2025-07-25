# インターンマッチングアプリ（修正版　こっちは画像をS3にアップロードできる。）

## デモ動画
<p align="center">
  <img src="https://github.com/ajdjaiuoapooiad/next-rails-work-frontend-pageRouter/blob/main/-GoogleChrome2025-03-3015-30-15-ezgif.com-video-to-gif-converter.gif" alt="デモ動画" width="600" style="border-radius: 10px;">
</p>

## URL
https://next-rails-work-frontend-page-router.vercel.app

**重要:** API側のインフラにRenderを使用しているため、初回アクセス時や操作によってはデータの取得に時間がかかる場合があります。しばらくお待ちいただくか、再試行してください。

## テスト用アカウント（ログイン用）

| アカウント種別 | メールアドレス | パスワード |
|---|---|---|
| 企業 (株式会社DeNa) | aaa4@a.com | password |
| 学生 (学生yukito) | aaa2@a.com | password |

## テスト方法 (面接官向け)

### 全体的な動作確認
1.  **ダッシュボードへのアクセス:**
    * URLにアクセスし、トップページからログインまたはダッシュボードへ遷移できることを確認します。
    * 初回アクセス時のAPI遅延を考慮し、応答時間を確認します。

### 機能別テスト

#### 1. 求人情報管理
* **企業:** 登録、編集、削除、一覧表示、募集一覧の機能が正常に動作することを確認します。
* **学生:** 閲覧、フィルター機能、いいね機能、いいね一覧、詳細表示の機能が正常に動作することを確認します。

#### 2. ユーザー認証
* 学生・企業アカウントでの登録（任意）、ログイン、ログアウトが正常に動作することを確認します。
* 各アカウントで権限が異なることを確認します。

#### 3. メッセージ機能
* 学生・企業間でメッセージの送受信、履歴表示が正常に動作することを確認します。

#### 4. プロフィール機能
* 学生・企業それぞれで登録、編集、表示が正常に動作することを確認します。
* 他のユーザーのプロフィールを閲覧できることを確認します。

#### 5. レスポンシブデザイン
* PC、タブレット、スマートフォンなど 多様な画面サイズでレイアウトが崩れないことを確認します。

#### 6. APIテスト
* Postmanなどを利用し、求人、認証、メッセージ、プロフィール、ユーザー一覧、各種一覧関連のAPIが正常に動作し、期待通りのレスポンスであることを確認します。

#### 7. エラーハンドリング
* 無効な入力や不正なデータに対して、適切なエラーメッセージが表示されることを確認します。



#### デプロイできなかった機能
* **画像の保存:** クラウドストレージ連携が必要なため、今回のデプロイでは未実装です。ローカル環境では実装できている可能性があります。

# プロジェクト概要
インターンシップを求める学生と、インターンシップを提供したい企業をマッチングするためのWebアプリケーションです。

## 技術スタック
* **フロントエンド:** Next.js (TypeScript), Tailwind CSS, shadcn-ui
* **バックエンド:** Ruby on Rails (APIモード)
* **データベース:** MySql (開発環境、本番環境)
* **APIテスト:** Postman
* **デプロイ:** Vercel, Heroku(Dockerコンテナを丸ごとデプロイするため、、)
* **クラウドストレージ:** aws S3(デプロイ先の画像の保存先として、、)
* **その他:** Git, GitHub, Docker(デプロイ先でDBの差異で画像がアップロードできない問題が起こったため、ローカルと本番環境の差異をなくすために導入した、、)

## 主な機能
* 求人情報管理 (CRUD + フィルター + いいね)
* ユーザー認証
* メッセージ機能
* プロフィール機能 (他のユーザー閲覧可)
* ユーザー一覧
* 各種一覧 (募集した求人、いいね、いいねした求人、応募した求人)

## 工夫した点
* モダンなUIとシンプルなデザイン
* 快適な操作性（レスポンシブデザイン）
* RESTful API設計

## 苦労した点
* UI/UXとレスポンシブデザインの両立
* データベース設計とパフォーマンス
* クラウドストレージサービス連携の困難さ

## 今後の展望
* 検索・フィルタリング機能強化
* マッチングアルゴリズム改善
* UI/UX改善
* 便利な機能追加
* 画像保存機能の実装

## 開発者の学び
* Webアプリケーション開発全般
* クラウドストレージサービスの基礎

## 動作確認方法
* リポジトリをクローンし、環境構築後に起動
* ブラウザでアクセス
* PostmanでAPIテスト

## 備考
本プロジェクトは個人開発であり商用利用は想定していません。

## 作者
竹内悠人
