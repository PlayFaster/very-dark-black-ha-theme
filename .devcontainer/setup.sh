#!/bin/sh

# Setup log directory
mkdir -p .reports/devcontainer ;
LOG_FILE=".reports/devcontainer/post_setup.log" ;

# Function to run the setup steps
run_setup() {
    echo "--- Starting Post-Create Setup ---" ;
    
    echo "Configuring Git..." ;
    git config --global core.fileMode false ;
    git config --global core.autocrlf input ;

    echo "Installing system packages (apk)..." ;
    apk update ;
    apk add nodejs npm bash libc6-compat ncurses coreutils ;

    echo "Installing Python test dependencies..." ;
    # Added codespell for spell checking
    pip install -r .validate/requirements_test.txt codespell ;

    echo "Installing global NPM tools..." ;
    npm install -g @google/gemini-cli markdown-link-check markdownlint-cli prettier ;

    echo "Configuring Gemini CLI..." ;
    # Clean up path by stripping any carriage returns
    NODE_ROOT=$(npm root -g | tr -d '\r') ;
    REAL_GEMINI_PATH="$NODE_ROOT/@google/gemini-cli/bundle/gemini.js" ;

    # Use series of && to avoid if/then/else/fi syntax errors with Windows line endings
    [ -f "$REAL_GEMINI_PATH" ] && echo "Found Gemini at: $REAL_GEMINI_PATH" ;
    [ -f "$REAL_GEMINI_PATH" ] && sed -i '1s|.*|#!/usr/bin/node|' "$REAL_GEMINI_PATH" ;
    [ -f "$REAL_GEMINI_PATH" ] && ln -sf "$REAL_GEMINI_PATH" /usr/local/bin/gemini ;
    [ -f "$REAL_GEMINI_PATH" ] && chmod +x /usr/local/bin/gemini ;
    [ -f "$REAL_GEMINI_PATH" ] && echo "Gemini CLI configured successfully." ;
    [ -f "$REAL_GEMINI_PATH" ] || echo "Warning: gemini.js not found at $REAL_GEMINI_PATH. Manual check required." ;

    echo "--- Setup Complete ---" ;
}

# Execute main function and pipe all output to tee
# This ensures stdout and stderr are visible in the terminal AND saved to the log
run_setup 2>&1 | tee "$LOG_FILE" ;
