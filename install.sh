#!/bin/bash
#last updated on:07-05-2021:12:29
#codded by th3cr00k3dm4n
 banner()
 {
echo "╔══╗──────────────╔╗"
echo "║╔╗║──────────────║║"
echo "║╚╝╚╦══╦══╦╦══╗╔══╣║╔╦══╗"
echo "║╔═╗║╔╗║══╬╣╔═╝║╔╗║╚╝╣╔╗║"
echo "║╚═╝║╔╗╠══║║╚═╗║╚╝║╔╗╣╚╝║"
echo "╚═══╩╝╚╩══╩╩══╝║╔═╩╝╚╩═╗║"
echo "───────────────║║────╔═╝║"
echo "───────────────╚╝────╚══╝"
echo "───────╔╗───╔╗╔╗"
echo "──────╔╝╚╗──║║║║"
echo "╔╦═╗╔═╩╗╔╬══╣║║║╔══╦═╗"
echo "╠╣╔╗╣══╣║║╔╗║║║║║║═╣╔╝"
echo "║║║║╠══║╚╣╔╗║╚╣╚╣║═╣║"
echo "╚╩╝╚╩══╩═╩╝╚╩═╩═╩══╩╝"
echo ""
echo ""
echo ""
echo "Codded by : th3cr00kedm4n" | lolcat -a -d 10
echo ""
echo ""
 }

pkg=( "python" "python2" "pip" "php" "openssh" "curl" "nano" "toilet" "nmap" "figlet" "unzip" "tor" "wget" "toilet"  "ruby" "cowsay" "cacafire" "cmatrix" )


run_depen()
{
 clear
 echo "installing depedency....."
 pkg install ruby -y && gem install lolcat || run_depen
}


run_script()
{
  banner
PS3='SELECT An OPTION : '
 options=("Auto Install basic packages" "manually install packages" "Install extra keys" "Uninstall packages" "Games for termux" "About" "Quit")
select opt in "${options[@]}"
do
    case $opt in

        "Auto Install basic packages")
        clear
           run_install
break
          ;;

          "manually install packages")
          clear
          run_manual
break
           ;;

         "Install extra keys")
         clear
            run_extra
break
   ;;

        "Uninstall packages")
        clear
            run_uninstall
break
            ;;

            "Games for termux")
            clear
            run_games
break
           ;;

         "About")
         clear
         banner
         echo "BASIC PACKAGE INSTALLER"
         echo "note that this is for noobies"
         echo ""
         echo "Codded by : th3cr00kedm4n"
         echo "visit https://bit.ly/th3cr00k3dm4n for more"
         echo "thanks for your support and don't forget to give a star on github"
         echo "GitHub : https://github.com/th3cr00k3dm4n"
break
            ;;

        "Quit")
       echo "thanks for using this tool"
      echo "for more visit bit.ly/th3cr00k3dm4n"
        echo "exiting ...."
            break
            ;;

        *) echo "INVALID OPTION $REPLY";;
    esac
done

}




run_install()
{
    clear
    banner
    read -p "This will install some basic packages for tremux Do you want to install ? [Y/n] :" ans
    if [ $ans == "y" ]
    then
        {
        pkg install ${pkg[@]} -y && echo " finished" || echo "failed" && run_install
        }
     else echo "failed" || run_install
    fi
    run_script
}




run_manual()
{
   clear
   banner
   read -p "Enter package name: " pk
      echo ""
      echo ""
      dpkg -s $pk >/dev/null 2>&1 || pkg install $pk && clear && echo "package has successfully installed" || echo "failed"

run_script
}

run_extra()
{
 clear
 banner
 read -p "Do you want to install extra keys ? [Y/n] :" ans
    if [ $ans == "y" ]
    then
    {
     mkdir $HOME/.termux/ ;echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties && termux-reload-settings && sleep 1
     }
      else echo "failed" || run_extra
    fi
run_script
 }


run_uninstall()
{
 clear
 banner
    read -p "Do you want to uninstall basic packages ? [Y/n] :" ans
    if [ $ans == "y" ]
    then
        {
        pkg  uninstall ${pkg[@]} -y && clear && echo "finished uninstalling" || echo " failed"
        }
    else echo "failed" || run_uninstall
    fi

run_script
}

run_games()
{
  clear
  banner
  echo ""
  echo ""
  dpkg -s git >/dev/null 2>&1 || pkg install git -y
  echo " working.."
  cd $HOME
  git clone https://github.com/th3cr00k3dm4n/games
  cd $HOME
  cd games
  chmod +x *
  ./games.sh  || run_games

}

run_depen && run_script
