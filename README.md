# README

## デプロイ方法
1. ローカルの内容をgitに反映 <br>
	CSSを変更している場合は下記も実行 <br>
	`rake assets:precompile` <br>
	`git add .` <br>
	`git commit -m "変更内容を記載"` <br>
	`git push origin master` <br>
1. 変更が反映されているかの確認 <br>
	https://github.com/uka3/UKA <br>
1. サーバー接続 <br>
	`ssh -i ~/ws/develop_common/uka.pem ec2-user@ec2-54-169-29-250.ap-southeast-1.compute.amazonaws.com` <br>
	サーバー接続ではアドレスが変わる場合もあり接続できなくなるケースもあります。 <br>
	その場合、AWSの <br>
	https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#Instances:sort=instanceId  <br>
	こちらに行っていただいて、「パブリック DNS (IPv4)」を参照し <br>
	`ssh -i ~/ws/develop_common/uka.pem ec2-user@「パブリック DNS (IPv4)」` <br>
	で入れるようになります <br>
1. スーパーユーザーへ切り替えてukaのアプリがあるディレクトリへ移動 <br>
	`sudo su -` <br>
	`cd /usr/local/app/uka` <br>
1. github上の最新を取得 <br>
	`git pull origin master` <br>
	Gemfileを変更している場合 <br>
	`bundle install` <br>
	migrationファイルが追加されている場合 <br>
	`rake db:migrate RAILS_ENV=production` <br>
1. アプリケーションサーバーの再起動 <br>
	`rake unicorn:restart` <br>