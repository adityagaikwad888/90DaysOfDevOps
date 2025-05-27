#!/bin/bash


usages() { echo -e "Here are the usages of this program ..... \n-u : Username\n-p : Password\n-c : Create New User [ -c -u "user" -p "password" ]\n-d : Delete User [ -d -u "user" ]\n-h : usages [ -h ] \n-l : user list [ -l ]\n-r reset pass of user [ -r -u "user"]" 

	exit 1;
}


username=""
password=""
user_create_flag=false
user_delete_flag=false
user_pass_reset_flag=false
user_list_flag=false

while getopts ":u:p:cdhlr"	 o;
do
	case "${o}" in
		u)
			username="$OPTARG"
			;;
		p)
			password="$OPTARG"
			;;
		c)
			user_create_flag=true
			;;
		d)
			user_delete_flag=true
			;;
		h)
			usages
			;;
		l)
			user_list_flag=true
			;;
		r)
			user_pass_reset_flag=true
			;;
		*)
			echo -e "invalid option ${o}\n Here are the usages ->\n"
			usages
			;;
	esac

done




if $user_create_flag;
then

	if id $username > /dev/null 2>&1;
	then
		echo -e "\nUser already exist ... try with differente one !"
	else
		sudo useradd -m $username
                echo -e "$password\n$password" | sudo passwd $username | > /dev/null
                echo -e "\nUser Created Successfully ... \n"
	fi
fi


if $user_delete_flag;
then
	if id $username > /dev/null 2>&1;
	then
		sudo userdel $username
		sudo rm -r "/home/$username"

		if id $username > /dev/null 2>&1;
		then
			echo -e "\nSomething went wrong\n"
		else
			echo -e "\nUser Deleted Successfully ... \n"
		fi
	else 
		echo -e "\nUser Not Found ! \n"
	fi
fi


if $user_pass_reset_flag;
then
	newpass=""
	cnfpass=""
	if id $username > /dev/null 2>&1;
	then
		read -p "Enter new pass : " newpass
		read -p "Enter confirm pass : " cnfpass

		if [ "$newpass"="$cnfpass" ]
		then
			echo -e "$newpass\n$cnfpass" | sudo passwd $username
			echo -e "\nPassword Reset ... Successful\n"
		fi
	fi
fi

if $user_list_flag;
then
	userlist=$(getent passwd | cut -d: -f1 )
	echo -e "$userlist"
fi
