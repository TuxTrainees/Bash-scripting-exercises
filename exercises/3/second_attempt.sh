#!/bin/bash

get_input() {
  local prompt="$1"
  local temp_file="/tmp/dialog_input.tmp"

  dialog --inputbox "$prompt" 10 30 2> "$temp_file"

  local input=$(cat "$temp_file")
  rm -f "$temp_file"

  echo "$input"
}

a=$(get_input "Enter the first number:")
b=$(get_input "Enter the second number:")
operation=$(get_input "Enter the operator (+, -, *, /):")

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
