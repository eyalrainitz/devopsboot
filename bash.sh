#!/bin/bash
PASSWORD="."
OPTION=$1
if [ $OPTION == "-f" ];
then
    if ! [ -f $2 ];
    then
        echo "This file doesn't exist" && exit 1;
    fi
PASSWORD=`cat $2`
else
 PASSWORD=$1
 fi
ISOK=0 
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
if [ ${#PASSWORD} -lt 10 ]; then
echo -e "${RED}minimun 10 cherecters${NC}" && ISOK=1
fi
if ! [[  "$PASSWORD" =~ [[:upper:]] ]]; then
  echo -e "${RED}uppercase character not found${NC}" && ISOK=1
fi
if ! [[ $PASSWORD =~ [[:digit:]] ]]; then
echo  -e "${RED}password miss digit${NC}" && ISOK=1
fi
if ! [[ $PASSWORD =~  [[:lower:]] ]]; then
echo -e "${RED}password miss lowercase${NC}" && ISOK=1
fi
if [[ $PASSWORD =~ ['!@#$%^&*()_+'] ]];then
  echo -e "${GREEN}It contains one of those !@#$%^&*()_+${NC}"
fi
if [ ISOK == 1 ]; then
echo -e "${RED}password is not strong${NC}" && exit 1;
else 
echo -e "${GREEN} password is ok${NC}" && exit 0;
fi