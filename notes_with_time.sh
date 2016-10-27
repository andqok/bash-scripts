#!/bin/bash

_MONTH=$(date +"%m")
_DATE=$(date +"%Y-%m-%d")
_DAYNUM=$(date +"%d")
_YEAR=$(date +"%Y")
_YDAY=$(date +"%j")
_TIME=$(date +"%H:%M")
_WEEK=$(date +"%U")

cd "/home/dre/Документи"

case "$_MONTH" in
	01)
		_MONTH="January";
		;;
	02)
		_MONTH="February";
		;;
	03)
		_MONTH="March";
		;;
	04)
		_MONTH="April";
		;;
	05)
		_MONTH="May";
		;;
	06)
		_MONTH="June";
		;;
	07)
		_MONTH="July";
		;;
	08)
		_MONTH="August";
		;;
	09)
		_MONTH="September";
		;;
	10)
		_MONTH="October";
		;;
	11)
		_MONTH="November";
		;;
	12)
		_MONTH="December";
		;;
esac

touch $_DATE.txt
echo -e '\t'$_MONTH $_DAYNUM,  $_TIME> $_DATE.txt
echo -e '\t'day $_YDAY, week $_WEEK of year $_YEAR>> $_DATE.txt
echo -e '\t'>> $_DATE.txt
echo -e '\t'>> $_DATE.txt
echo "Success!"

gedit $_DATE.txt
