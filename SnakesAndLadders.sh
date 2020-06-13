#!/bin/bash
echo Welcome to Snakes And Ladders Game
START=0;
FINISH=100;
player1Position=$START
player2Position=$START
declare -A positionOne
declare -A positionTwo
outcome=$START
option=$START
rollCount=$START
dieRollCount=$START
rollCountOne=$START
rollCountTwo=$START
function dieRoll(){
	outcome=$(( $RANDOM%6 + 1 ))
	echo The outcome of the die roll is $outcome
}
function options(){
	playerPosition=$1
	rollCount=$2
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
	(( rollCount++ ))
}
function play(){
		playerPosition=$1
		dieRollCount=$2
		options $playerPosition $rollCountOne 
		if [ $playerPosition -lt $START ]
			then
			playerPosition=$START
		elif [ $playerPosition -gt $FINISH ]
			then
			playerPosition=$(( $playerPosition-$outcome ))
		fi
		dieRollCount=$rollCount
}
function message(){
        echo $1 has won the Game
        echo The dice was played $2 times to win the game
}
function winner(){
	while [ $player1Position -lt $FINISH -a $player2Position -lt $FINISH ]
	do
		play $player1Position $rollCountOne			#Calling play function and passing the arguments for player1
		player1Position=$playerPosition				#Storing Player1 position to use in the while loop
		rollCountOne=$dieRollCount				#Storing die roll count for player1
		positionOne[$rollCountOne]=$(( $player1Position ))	#Storing Player1 position after each die roll in a dictionary
		echo Player1 Position is $player1Position
		play $player2Position $rollCountTwo			#Calling play function and passing the arguments for player2
		player2Position=$playerPosition				#Storing Player2 position to use in the while loop
		rollCountTwo=$dieRollCount				#Storing die roll count for player2
		positionTwo[$rollCountTwo]=$(( $player2Position ))	#Storing Player2 position after each die roll in a dictionary
		echo Player2 position is $player2Position
	done
	if [ $player1Position -eq $FINISH ]
		then
		message Player1 $rollCountOne
		else
		message Player2 $rollCountTwo
	fi
}
winner
