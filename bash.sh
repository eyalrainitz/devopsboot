#!/bin/bash
PASSWORD="$@"
ISOK=0
if [ ${#PASSWORD} -lt 10 ]; then
echo "minimun 10 cherecters" && ISOK=1
fi
if ! [[  "$PASSWORD" =~ [[:upper:]] ]]; then
  echo "uppercase character not found" && ISOK=1
fi
if ! [[ $PASSWORD =~ [[:digit:]] ]]; then
echo "password miss digit" && ISOK=1
fi
if ! [[ $PASSWORD =~  [[:lower:]] ]]; then
echo "password miss lowercase" && ISOK=1
fi
if [[ $PASSWORD =~ ['!@#$%^&*()_+'] ]];then
  echo "It contains one of those !@#$%^&*()_+"
fi
if [ ISOK == 1 ]; then
echo "password is not strong" && exit 1;
else 
echo "password is ok" && exit 0;
fi