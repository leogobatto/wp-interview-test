#!/bin/bash

# Pint Wrapper Script for Lando/Local Environment Detection
# This script automatically detects whether to use Lando or local Pint

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

# Function to check if local Pint is available
check_local_pint() {
    if [ -f ./vendor/bin/pint ]; then
        return 0
    elif command -v pint &> /dev/null; then
        return 0
    fi
    return 1
}

# Main execution logic
if check_lando; then
    # Use Lando Pint
    exec lando pint "$@"
elif [ -f ./vendor/bin/pint ]; then
    # Use project-local Pint
    exec ./vendor/bin/pint "$@"
elif command -v pint &> /dev/null; then
    # Use globally installed Pint
    exec pint "$@"
else
    echo "Error: Pint not found" >&2
    echo "Please ensure either:" >&2
    echo "  1. Lando is running: lando start" >&2
    echo "  2. Pint is installed via Composer in project or theme" >&2
    echo "  3. Pint is installed globally" >&2
    exit 1
fi
