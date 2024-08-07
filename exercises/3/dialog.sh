#!/bin/bash
Get_integer_input() {
    local Prompt=$1
    local Input

    while true; do
        Input=$(dialog --inputbox "$Prompt" 10 30 3>&1 1>&2 2>&3)
         echo "$Input"
             return
    done
}

a=$(Get_integer_input "Enter an integer for a:")
b=$(Get_integer_input "Enter an integer for b:")
operation=$(Get_integer_input "Enter an operation (+ - * /)")

clear

echo "You entered a = $a"
echo "You entered b = $b"
echo "You entered c = $operation"

Sum=$(echo "$a + $b" | bc)
Difference=$(echo "$a - $b" | bc)
Product=$(echo "$a * $b" | bc)
Quotient=$(echo "scale=4; $a / $b" | bc)

case "$operation" in
    "+")
        echo "Sum: $a + $b = $Sum"
        ;;
    "-")
        echo "Difference: $a - $b = $Difference"
        ;;
    "*")
        echo "Product: $a * $b = $Product"
        ;;
    "/")
        echo "Quotient: $a / $b = $Quotient"
        ;;
esac
