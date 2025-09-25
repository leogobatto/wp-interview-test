#!/bin/bash

# PHP Wrapper Script for Lando/Local Environment Detection
# This script automatically detects whether to use Lando or local PHP

# Function to check if Lando is available and project is running
check_lando() {
    if command -v lando &> /dev/null && [ -f .lando.yml ]; then
        # Check if Lando project is running
        if lando info &> /dev/null 2>&1; then
            return 0
        fi
    fi
    return 1
}

# Function to check if local PHP is available
check_local_php() {
    if command -v php &> /dev/null; then
        return 0
    fi
    return 1
}

# Main execution logic
if check_lando; then
    # Use Lando PHP
    exec lando php "$@"
elif check_local_php; then
    # Use local PHP as fallback
    exec php "$@"
else
    echo "Error: No PHP executable found (neither Lando nor local)" >&2
    echo "Please ensure either:" >&2
    echo "  1. Lando is running: lando start" >&2
    echo "  2. PHP is installed locally" >&2
    exit 1
fi
