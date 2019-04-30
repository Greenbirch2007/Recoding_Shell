#!/bin/bash
aa="this is aa"
bb="this is bb"

function name(){
	local cc="this is cc"
	local dd="this is dd"
	echo $aa,$bb
	echo $cc
	return 0
}
echo $dd
name
