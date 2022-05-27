RED='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'
Blue='\033[0;34m'

display_end() {
echo "${Blue}   /\$\$\$                           /\$\$   /\$\$                         /\$\$             /\$\$\$  ${NC}"
echo "${Blue}  /\$\$_/                          |__/  | \$\$                        | \$\$            |_  \$\$ ${NC}"
echo "${Blue} | \$\$          /\$\$\$\$\$\$   /\$\$\$\$\$\$  /\$\$ /\$\$\$\$\$\$    /\$\$\$\$\$\$   /\$\$\$\$\$\$\$| \$\$\$\$\$\$\$         | \$\$ ${NC}"
echo "${Blue} /\$\$\$         /\$\$__  \$\$ /\$\$__  \$\$| \$\$|_  \$\$_/   /\$\$__  \$\$ /\$\$_____/| \$\$__  \$\$        | \$\$\$${NC}"
echo "${Blue}|  \$\$        | \$\$\$\$\$\$\$\$| \$\$  \ \$\$| \$\$  | \$\$    | \$\$\$\$\$\$\$\$| \$\$      | \$\$  \ \$\$        | \$\$/${NC}"
echo "${Blue} \ \$\$        | \$\$_____/| \$\$  | \$\$| \$\$  | \$\$ /\$\$| \$\$_____/| \$\$      | \$\$  | \$\$        | \$\$ ${NC}"
echo "${Blue} |  \$\$\$      |  \$\$\$\$\$\$\$| \$\$\$\$\$\$\$/| \$\$  |  \$\$\$\$/|  \$\$\$\$\$\$\$|  \$\$\$\$\$\$\$| \$\$  | \$\$       /\$\$\$/ ${NC}"
echo "${Blue}  \___/       \_______/| \$\$____/ |__/   \___/   \_______/ \_______/|__/  |__/      |___/  ${NC}"
echo "${Blue}                       | \$\$                                                               ${NC}"
echo "${Blue}                       | \$\$                                                               ${NC}"
echo "${Blue}                       |__/                                                               ${NC}"
}

if [ $# -lt 1 ]
    then
        echo "Usage: Install_computer.sh [Package Manager {apt or dnf}]"
        echo "The package manager can only be apt or dnf"
        echo "Example: ./Install_computer.sh apt"
        exit 1
fi
if [ $# -gt 2 ]
    then
        echo "Usage: Install_computer.sh [Package Manager {apt or dnf}]"
        exit 1
fi

if [ "$1" = "apt" ]
    then
        $1 upgrade
        if [ $? -eq 100 ]
            then
                echo "${RED}Permision denied:${NC} Use sudo"
                exit 2
        fi
        if [ $? -eq 127 ]
            then
                echo "wrong package manager used: [ $1 ]"
                exit 1
        fi
        if [ $? -gt 0 ]
            then
                echo "${RED}Installation failed:${NC} unknown error"
                exit $?
        fi
        $1 install git -y
        $1 install firefox -y
        $1 install gcc -y
        $1 install make -y
        $1 install zsh -y
        $1 install sl -y
        $1 install code
        $1 install libcsfml-dev -y
        $1 install emacs build-essential -y
        display_end
        echo "alias emacs="emacs -nw"" >> ~/.zshrc
        echo "${Green}Installation complete${NC}"
    else
        echo "Usage: Install_computer.sh [Package Manager {apt or dnf}]"
        echo "${RED}Unknown package manager:${NC} $1"
        exit 1
fi

if [ "$1" = "apt" ]
    then
        $1 upgrade
        if [ $? -eq 100 ]
            then
                echo "${RED}Permision denied:${NC} Use sudo"
                exit $?
        fi
        if [ $? -eq 127 ]
            then
                echo "wrong package manager used: [ $1 ]"
                exit $?
        fi
        if [ $? -gt 0 ]
            then
                echo "${RED}Installation failed:${NC} unknown error"
                exit $?
        fi
        $1 install git -y
        $1 install firefox -y
        $1 install gcc -y
        $1 install make -y
        $1 install zsh -y
        $1 install sl -y
        $1 install code
        $1 install libcsfml-dev -y
        $1 install emacs build-essential -y
        display_end
        echo "alias emacs="emacs -nw"" >> ~/.zshrc
        echo "${Green}Installation complete${NC}"

    else
        echo "Usage: Install_computer.sh [Package Manager {apt or dnf}]"
        echo "${RED}Unknown package manager:${NC} $1"
        exit 1
fi
