#!/bin/bash -x
echo Welcome to Snakes And Ladders Game
START=0;
FINISH=100;
playerPosition=$START
outcome=0;
option=0;
function dieRoll(){
	outcome=$(( $RANDOM%6 + 1 ))
	echo The outcome of the die roll is $outcome
}
function options(){
	dieRoll
	option=$(( $RANDOM%3 ))
	if [ $option -eq 1 ]
		then
		echo Ladder
		playerPosition=$(( $playerPosition+$outcome ))
	elif [ $option -eq 2 ] 
		then
		echo Snake
		playerPosition=$(( $playerPosition-$outcome ))
	else
		echo No Play
	fi
}
function play(){
	while [ $playerPosition -lt $FINISH ]
	do
		options
		if [ $playerPosition -lt $START ]
			then
			playerPosition=$START
		fi
		echo Player Position is $playerPosition
	done
	echo The player has won
}
play
