#!/bin/bash


get_integer_input() {
    local prompt=$1
    local input

    while true; do
        input=$(dialog --inputbox "$prompt" 10 30 2>&1 >/dev/tty)
         echo "$input"
             return

    done
}
a=$(get_integer_input "Enter an integer for a:")
b=$(get_integer_input "Enter an integer for b:")
operation=$(get_integer_input "Enter an operation (+ - * /)")
clear
echo "You entered a = $a"
echo "You entered b = $b"
echo "You entered c = $operation"

sum=$(echo "$a + $b" | bc)
difference=$(echo "$a - $b" | bc)
product=$(echo "$a * $b" | bc)
quotient=$(echo "scale=4; $a / $b" | bc)
case "$operation" in
    "+")
        echo "Sum: $a + $b = $sum"
        ;;
    "-")
        echo "Difference: $a - $b = $difference"
        ;;
    "*")
        echo "Product: $a * $b = $product"
        ;;
    "/")
        echo "Quotient: $a / $b = $quotient"
        ;;
esac
