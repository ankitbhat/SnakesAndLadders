#!/bin/bash
echo Welcome to Snakes And Ladders Game
START=0;
FINISH=100;
playerPosition=$START
declare -A position
outcome=0;
option=0;
rollCount=0;
function dieRoll(){
	outcome=$(( $RANDOM%6 + 1 ))
	echo The outcome of the die roll is $outcome
	(( rollCount++ ))
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
		elif [ $playerPosition -gt $FINISH ]
			then
			playerPosition=$(( $playerPosition-$outcome ))
		fi
		echo Player Position is $playerPosition
		position[$rollCount]=$(( $playerPosition ))
	done
	echo The player has won
	echo The dice was played $rollCount times to win the game
	for element in ${!position[@]}
	do
		echo The position after die role $element is ":" ${position[$element]}
	done | sort -V
}
play
