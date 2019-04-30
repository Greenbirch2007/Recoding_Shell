#!/bin/bash


array_var[one]=one-1
array_var[two]=two-2
array_var[three]=three-3
array_var[four]=four-4
array_var[five]=five-5
array_var[six]=six-6


echo ${!array_var[*]}
