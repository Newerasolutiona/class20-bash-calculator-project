#!/bin/bash

# Function to display the calculator menu
display_menu() {
    echo "Simple Bash Calculator"
    echo "----------------------"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Modular Operation"
    echo "6. Factorial"
    echo "7. Greatest Common Divisor"
    echo "8. Square Root"
    echo "0. Exit"
    echo "----------------------"
}

# Initialize array to store history
declare -a history

# Function to perform addition
addition() {
    echo -n "Enter first number: "
    read num1
    echo -n "Enter second number: "
    read num2
    result=$(echo "$num1 + $num2" | bc)
    echo "Result: $result"
    history+=("Addition: $num1 + $num2 = $result")
}

# Function to perform subtraction
subtraction() {
    echo -n "Enter first number: "
    read num1
    echo -n "Enter second number: "
    read num2
    result=$(echo "$num1 - $num2" | bc)
    echo "Result: $result"
    history+=("Subtraction: $num1 - $num2 = $result")
}

# Function to perform multiplication
multiplication() {
    echo -n "Enter first number: "
    read num1
    echo -n "Enter second number: "
    read num2
    result=$(echo "$num1 * $num2" | bc)
    echo "Result: $result"
    history+=("Multiplication: $num1 * $num2 = $result")
}

# Function to perform division
division() {
    echo -n "Enter first number: "
    read num1
    echo -n "Enter second number: "
    read num2
    if [ "$num2" -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
    else
        result=$(echo "scale=2; $num1 / $num2" | bc)
        echo "Result: $result"
        history+=("Division: $num1 / $num2 = $result")
    fi
}

# Function to perform Modular Arithmetic
modulo() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    m=$((a % b))
    echo "Remainder: $m"
    history+=("Modulo: $a % $b = $m")
}

# Function to compute factorial
factorial() {
    echo -n "Enter a Number: "
    read n
    if [ "$n" -lt 0 ]; then
        echo "Error: Factorial is not defined for negative numbers."
    else
        f=1
        for (( i = 2; i <= n; i++ )); do
            f=$((f * i))
        done
        echo "Result: $f"
        history+=("Factorial: $n! = $f")
    fi
}

# Function to compute Greatest Common Divisor (GCD)
gcd() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    x=$a
    y=$b
    while [ $y -ne 0 ]; do
        t=$y
        y=$((x % y))
        x=$t
    done
    echo "Result: $x"
    history+=("GCD: GCD of $a and $b = $x")
}

# Function to compute square root
square_root() {
    echo -n "Enter a number: "
    read -r numb
    result=$(echo "scale=2; sqrt($numb)" | bc)
    echo "Result: $result"
    history+=("Square Root: sqrt($numb) = $result")
}

# Main script execution
while true; do
    display_menu
    echo -n "Choose an operation (0-8): "
    read choice

    case $choice in
        1)
            addition
            ;;
        2)
            subtraction
            ;;
        3)
            multiplication
            ;;
        4)
            division
            ;;
        5)
            modulo
            ;;
        6)
            factorial
            ;;
        7)
            gcd
            ;;
        8)
            square_root
            ;;
        0)
            echo "Exiting the calculator. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
    echo "----------------------"
done

# Display history
echo "Computation History:"
for (( i = 0; i < ${#history[@]}; i++ )); do
    echo "$((i + 1)). ${history[$i]}"
done
