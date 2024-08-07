COLER_BACE='\033['
RESET_COLOR='\033[0m'

for i in {0..9}; do
  color="${COLER_BACE}3${i}m"
  echo -e "${color}Hello World!${RESET_COLOR}"
done


