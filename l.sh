#!/bin/sh
launcher()
{
	if [ $# -lt 1 ]; then
		launcher help
		return
	fi
	case "$1" in
		"w" )
			cd ~/vagrant/wordpress45/ &&\
			vagrant up &&\
			vagrant ssh -- docker-compose up
		;;
		"w_s" )
			cd ~/vagrant/wordpress45/ &&\
			vagrant ssh
		;;
		"w_h" )
			cd ~/vagrant/wordpress45/ &&\
			vagrant halt
		;;
		"gulp" )
			cd ~/Tools/Scripts/gulp/ &&\
			npm start
		;;
		"mv" )
			# TODO : launcherの中に入れる実行ファイルはchmod 700をやってから。
			mv $2 ~/Tools/Scripts/launcher/
		;;
		"l" )
			cd $HOME/Tools/Scripts/launcher/
		;;
		"d" )
			cd $HOME/Desktop
		;;
		'help' )
			cat <<-EOF
			
				This is command launcher!
				you can choose next commands.

				1) ヘルプ起動
				　　l help
				2) gulp起動
				　　l gulp
				3) wordpressを起動
				　　l w
				4) wordpressサーバーにssh
				　　l w_s
				5) wordpressサーバーをshutdown
				　　l w_h
				6) launcherの中に現在のパスにあるファイルを移動。
				　　l mv "<filename>"
				7) launcherフォルダに移動。
				　　l l
				8) Desktopに移動。
				　　l d

			EOF
		;;
		* )
		# launcherフォルダの中にあるshファイルの名前を入力すると、
		# そのシェルが実行される。
		# 
		# 例:
		# l add   => launcher/add.shが実行される。
			if [ -e ~/Tools/Scripts/launcher/$1.sh ]; then
				cd ~/Tools/Scripts/launcher/&&
				./$1.sh
			else
				launcher help
			fi
		;;
	esac
}
launcher $@