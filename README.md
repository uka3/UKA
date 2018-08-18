# README

* デプロイ方法
	1. ローカルの内容をgitに反映
		CSSを変更している場合は下記も実行
		`rake assets:precompile`
		`git add .`
		`git commit -m "変更内容を記載"`
		`git push origin master`
	1. 変更が反映されているかの確認
		https://github.com/uka3/UKA
	1. サーバー接続
		`ssh -i ~/ws/develop_common/uka.pem ec2-user@ec2-54-169-29-250.ap-southeast-1.compute.amazonaws.com`
		サーバー接続ではアドレスが変わる場合もあり接続できなくなるケースもあります。
		その場合、AWSの
		https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#Instances:sort=instanceId
		こちらに行っていただいて、「パブリック DNS (IPv4)」を参照し
		`ssh -i ~/ws/develop_common/uka.pem ec2-user@「パブリック DNS (IPv4)」`
		で入れるようになります
	1. スーパーユーザーへ切り替えてukaのアプリがあるディレクトリへ移動
		`sudo su -`
		`cd /usr/local/app/uka`
	1. github上の最新を取得
		`git pull origin master`
		Gemfileを変更している場合
		`bundle install`
		migrationファイルが追加されている場合
		`rake db:migrate RAILS_ENV=production`
	1. アプリケーションサーバーの再起動
		`rake unicorn:restart`