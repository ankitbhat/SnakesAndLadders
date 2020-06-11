#!/bin/bash
echo Welcome to Snakes And Ladders Game
START=0;
FINISH=100;
player1Position=$START
player2Position=$START
declare -A position1
declare -A position2
outcome=0;
option=0;
rollCount1=0;
rollCount2=0;
function dieRoll(){
	outcome=$(( $RANDOM%6 + 1 ))
	echo The outcome of the die roll is $outcome
}
function options1(){
	dieRoll
	option=$(( $RANDOM%3 ))
	if [ $option -eq 1 ]
		then
		echo Ladder
		player1Position=$(( $player1Position+$outcome ))
	elif [ $option -eq 2 ] 
		then
		echo Snake
		player1Position=$(( $player1Position-$outcome ))
	else
		echo No Play
	fi
	(( rollCount1++ ))
}
function options2(){
        dieRoll
        option=$(( $RANDOM%3 ))
        if [ $option -eq 1 ]
                then
                echo Ladder
                player2Position=$(( $player2Position+$outcome ))
        elif [ $option -eq 2 ] 
                then
                echo Snake
                player2Position=$(( $player2Position-$outcome ))
        else
                echo No Play
        fi
	(( rollCount2++ ))
}

function player1(){
		options1
		if [ $player1Position -lt $START ]
			then
			player1Position=$START
		elif [ $player1Position -gt $FINISH ]
			then
			player1Position=$(( $playerPosition-$outcome ))
		fi
		echo Player1 Position is $player1Position
		position1[$rollCount1]=$(( $player1Position ))
}
function player2(){
                options2
                if [ $player2Position -lt $START ]
                        then
                        player2Position=$START
                elif [ $player2Position -gt $FINISH ]
                        then
                        player2Position=$(( $playerPosition-$outcome ))
                fi
                echo Player2 Position is $player2Position
                position2[$rollCount2]=$(( $player2Position ))
}
function winner(){
	while [ $player1Position -lt $FINISH -a $player2Position -lt $FINISH ]
	do
		player1
		player2
	done
	if [ $player1Position -eq $FINISH ]
		then
		echo Player1 has won the Game
		echo The dice was played $rollCount1 times to win the game
		else
		echo Player2 has won the Game
		echo The dice was played $rollCount2 times to win the game
	fi
	echo The dice was played $rollCount times to win the game
	for element in ${!position1[@]}
        do
                echo The position for Player1 after die role $element is ":" ${position1[$element]}
        done | sort -V
	for element in ${!position2[@]}
        do
                echo The position for Player2 after die role $element is ":" ${position2[$element]}
        done | sort -V

}
winner
