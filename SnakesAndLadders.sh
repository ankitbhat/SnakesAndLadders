#!/bin/bash -x
echo Welcome to Snakes And Ladders Game
START=0;
FINISH=100;
playerPosition=$START
function dieRoll(){
	outcome=$(( $RANDOM%6 + 1 ))
	echo The outcome of the die roll is $outcome
}
dieRoll
