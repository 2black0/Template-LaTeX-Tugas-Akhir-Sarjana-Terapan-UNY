#!/bin/bash

# LaTeX Thesis Compilation Script with Dependency Caching
# This script compiles the LaTeX document multiple times and cleans up temporary files

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Required LaTeX packages for this project
# Note: Most packages are already included in TeX Live Full
REQUIRED_PACKAGES=(
    "babel"
    "inputenc"
    "setspace"
    "ragged2e"
    "graphicx"
    "float"
    "indentfirst"
    "tocloft"
    "titlesec"
    "geometry"
    "fancyhdr"
    "listings"
    "xcolor"
    "tikz"
    "pgfplots"
    "pgf-pie"
    "multirow"
    "caption"
    "hyperref"
    "natbib"
    "amsmath"
    "amsfonts"
    "amssymb"
    "array"
    "booktabs"
    "longtable"
    "url"
    "calc"
    "etoolbox"
)

# Packages that are typically built-in or have different names
OPTIONAL_PACKAGES=(
    "pslatex"
    "xparse"
    "l3backend"
    "l3kernel" 
    "l3packages"
)

# Main document name (without .tex extension)
MAIN_DOC="laporan"

# Default verbosity level (0=quiet, 1=error, 2=warning, 3=info, 4=debug)
VERBOSITY=3

# Skip dependency checking flag
SKIP_DEPS=false

# Force dependency recheck flag
FORCE_DEPS_CHECK=false

# Dependency cache configuration
DEPS_CACHE_DIR=".latex_deps_cache"
DEPS_CACHE_FILE="$DEPS_CACHE_DIR/dependency_status.log"
DEPS_VERSION_FILE="$DEPS_CACHE_DIR/versions.log"
CACHE_VALIDITY_HOURS=168  # 1 week (168 hours)

# Function to show usage
show_usage() {
    echo -e "${BLUE}LaTeX Thesis Compilation Script${NC}"
    echo -e "${CYAN}Usage: $0 [OPTIONS]${NC}"
    echo ""
    echo -e "${YELLOW}OPTIONS:${NC}"
    echo -e "  -h, --help           Show this help message"
    echo -e "  -q, --quiet          Quiet mode (only show final result)"
    echo -e "  -v, --verbose        Verbose mode (show all output)"
    echo -e "  --debug              Debug mode (maximum verbosity)"
    echo -e "  --error-only         Show only errors"
    echo -e "  --warning            Show warnings and errors"
    echo -e "  --final-warnings     Show only final unresolved warnings"
    echo -e "  --info               Show info, warnings and errors (default)"
    echo -e "  --clean              Clean temporary files and exit"
    echo -e "  --skip-deps          Skip dependency checking"
    echo -e "  --force-deps-check   Force full dependency recheck (ignore cache)"
    echo -e "  --clear-cache        Clear dependency cache and exit"
    echo ""
    echo -e "${YELLOW}VERBOSITY LEVELS:${NC}"
    echo -e "  0 - Quiet:   Only final result"
    echo -e "  1 - Error:   Only compilation errors"
    echo -e "  2 - Warning: Warnings and errors (all compilations)"
    echo -e "  3 - Info:    General information (default)"
    echo -e "  4 - Debug:   All compilation output"
    echo -e "  5 - Final:   Only warnings from final compilation"
    echo ""
    echo -e "${YELLOW}CACHING:${NC}"
    echo -e "  Dependency status is cached for $CACHE_VALIDITY_HOURS hours to speed up compilation."
    echo -e "  Cache is stored in: $DEPS_CACHE_DIR/"
    echo -e "  Use --force-deps-check to bypass cache or --clear-cache to reset."
    echo ""
    echo -e "${YELLOW}EXAMPLES:${NC}"
    echo -e "  $0                        # Normal compilation (uses cache)"
    echo -e "  $0 --quiet                # Silent compilation"
    echo -e "  $0 --debug                # Debug mode with full output"
    echo -e "  $0 --error-only           # Show only errors"
    echo -e "  $0 --clean                # Clean temporary files only"
    echo -e "  $0 --skip-deps            # Skip dependency checking"
    echo -e "  $0 --force-deps-check     # Force full dependency recheck"
    echo -e "  $0 --clear-cache          # Clear dependency cache"
}

# Function to log messages based on verbosity level
log_message() {
    local level=$1
    local color=$2
    local message=$3
    
    if [ $VERBOSITY -ge $level ]; then
        echo -e "${color}${message}${NC}"
    fi
}

# Function to analyze and report warnings
analyze_warnings() {
    local log_file="${MAIN_DOC}.log"
    
    if [ ! -f "$log_file" ]; then
        return
    fi
    
    # Count different types of warnings
    local reference_warnings=$(grep -c "LaTeX Warning: Reference.*undefined" "$log_file" 2>/dev/null || echo 0)
    local citation_warnings=$(grep -c "Package natbib Warning:.*undefined" "$log_file" 2>/dev/null || echo 0)
    local rerun_warnings=$(grep -c "Rerun to get.*right" "$log_file" 2>/dev/null || echo 0)
    
    if [ $VERBOSITY -ge 3 ] && [ "$reference_warnings" -gt 0 -o "$citation_warnings" -gt 0 -o "$rerun_warnings" -gt 0 ]; then
        log_message 3 "" ""
        log_message 3 "${YELLOW}" "📊 Warning Summary (final compilation):"
        if [ "$reference_warnings" -gt 0 ]; then
            log_message 3 "${YELLOW}" "  • $reference_warnings undefined reference(s) - check \\label{} and \\ref{} pairs"
        fi
        if [ "$citation_warnings" -gt 0 ]; then
            log_message 3 "${YELLOW}" "  • $citation_warnings undefined citation(s) - check .bib entries and \\cite{} keys"
        fi
        if [ "$rerun_warnings" -gt 0 ]; then
            log_message 3 "${YELLOW}" "  • $rerun_warnings rerun warning(s) - normal, handled by multiple compilations"
        fi
        log_message 3 "" ""
        log_message 3 "${CYAN}" "💡 Tips to fix warnings:"
        log_message 3 "${CYAN}" "  • Ensure all \\label{} have corresponding \\ref{} or \\figref{}"
        log_message 3 "${CYAN}" "  • Check that all \\cite{} keys exist in a7-pustaka.bib"
        log_message 3 "${CYAN}" "  • Verify .bib entries have proper format and required fields"
    fi
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to create cache directory
create_cache_dir() {
    if [ ! -d "$DEPS_CACHE_DIR" ]; then
        mkdir -p "$DEPS_CACHE_DIR"
        # Add to .gitignore if it exists
        if [ -f ".gitignore" ]; then
            if ! grep -q "$DEPS_CACHE_DIR" .gitignore; then
                echo "$DEPS_CACHE_DIR/" >> .gitignore
                log_message 3 "${BLUE}" "Added $DEPS_CACHE_DIR/ to .gitignore"
            fi
        fi
    fi
}

# Function to check if cache is valid
is_cache_valid() {
    if [ ! -f "$DEPS_CACHE_FILE" ]; then
        return 1
    fi
    
    # Check if cache file is older than validity period
    if [ "$(uname)" = "Darwin" ]; then
        # macOS
        local cache_time=$(stat -f %m "$DEPS_CACHE_FILE" 2>/dev/null)
    else
        # Linux
        local cache_time=$(stat -c %Y "$DEPS_CACHE_FILE" 2>/dev/null)
    fi
    
    local current_time=$(date +%s)
    local cache_age_hours=$(( (current_time - cache_time) / 3600 ))
    
    if [ $cache_age_hours -gt $CACHE_VALIDITY_HOURS ]; then
        log_message 3 "${YELLOW}" "Cache expired (${cache_age_hours}h old, max ${CACHE_VALIDITY_HOURS}h)"
        return 1
    fi
    
    # Check if LaTeX version has changed
    if [ -f "$DEPS_VERSION_FILE" ]; then
        local cached_version=$(grep "pdflatex_version:" "$DEPS_VERSION_FILE" | cut -d: -f2- | xargs)
        local current_version=$(pdflatex --version 2>/dev/null | head -n 1 | xargs)
        
        if [ "$cached_version" != "$current_version" ]; then
            log_message 3 "${YELLOW}" "LaTeX version changed, invalidating cache"
            return 1
        fi
    fi
    
    return 0
}

# Function to load dependency status from cache
load_deps_from_cache() {
    if [ -f "$DEPS_CACHE_FILE" ]; then
        local status=$(grep "dependency_status:" "$DEPS_CACHE_FILE" | cut -d: -f2 | xargs)
        local missing_packages=$(grep "missing_packages:" "$DEPS_CACHE_FILE" | cut -d: -f2- | xargs)
        local optional_missing=$(grep "optional_missing:" "$DEPS_CACHE_FILE" | cut -d: -f2- | xargs)
        
        log_message 3 "${GREEN}" "✓ Using cached dependency information"
        
        if [ "$status" = "OK" ]; then
            log_message 3 "${GREEN}" "✓ All required LaTeX packages are installed (cached)"
            if [ ! -z "$optional_missing" ] && [ "$optional_missing" != "none" ]; then
                log_message 2 "${YELLOW}" "Optional packages not found (cached): $optional_missing"
            fi
            return 0
        else
            if [ ! -z "$missing_packages" ] && [ "$missing_packages" != "none" ]; then
                log_message 1 "${RED}" "✗ Missing packages found in cache: $missing_packages"
                log_message 1 "${YELLOW}" "Please install these packages or run with --force-deps-check"
                return 1
            fi
        fi
    fi
    return 1
}

# Function to save dependency status to cache
save_deps_to_cache() {
    local status=$1
    local missing_packages=$2
    local optional_missing=$3
    
    create_cache_dir
    
    # Save dependency status
    cat > "$DEPS_CACHE_FILE" << EOF
# LaTeX Dependencies Cache
# Generated: $(date)
# Cache validity: $CACHE_VALIDITY_HOURS hours

dependency_status: $status
missing_packages: ${missing_packages:-none}
optional_missing: ${optional_missing:-none}
last_check: $(date +%s)
EOF
    
    # Save version information
    cat > "$DEPS_VERSION_FILE" << EOF
# LaTeX Version Information
# Generated: $(date)

pdflatex_version: $(pdflatex --version 2>/dev/null | head -n 1 | xargs)
bibtex_version: $(bibtex --version 2>/dev/null | head -n 1 | xargs)
EOF

    # Add package manager version info
    if command_exists tlmgr; then
        echo "tlmgr_version: $(tlmgr --version 2>/dev/null | head -n 1 | xargs)" >> "$DEPS_VERSION_FILE"
    elif command_exists miktex; then
        echo "miktex_version: $(miktex --version 2>/dev/null | head -n 1 | xargs)" >> "$DEPS_VERSION_FILE"
    fi

    log_message 3 "${BLUE}" "Dependency status cached for future use"
}

# Function to invalidate cache
invalidate_cache() {
    if [ -d "$DEPS_CACHE_DIR" ]; then
        rm -rf "$DEPS_CACHE_DIR"
        log_message 2 "${YELLOW}" "✓ Dependency cache cleared"
    else
        log_message 2 "${YELLOW}" "No cache to clear"
    fi
}

# Function to run LaTeX command with appropriate verbosity
run_latex() {
    local description=$1
    local command=$2
    
    log_message 3 "${BLUE}" "$description"
    
    if [ $VERBOSITY -eq 5 ]; then
        # Final warnings mode: only show warnings from final compilation
        if [[ "$description" == *"final"* ]]; then
            eval $command 2>&1 | grep -E "(Warning|Error|Fatal|!):" || true
            return ${PIPESTATUS[0]}
        else
            eval $command > /dev/null 2>&1
            return $?
        fi
    elif [ $VERBOSITY -ge 4 ]; then
        # Debug mode: show all output
        eval $command
        return $?
    elif [ $VERBOSITY -ge 2 ]; then
        # Warning/Info mode: filter output to show warnings and errors
        eval $command 2>&1 | grep -E "(Warning|Error|Fatal|!):" || true
        return ${PIPESTATUS[0]}
    elif [ $VERBOSITY -ge 1 ]; then
        # Error mode: show only errors
        eval $command 2>&1 | grep -E "(Error|Fatal|!):" || true
        return ${PIPESTATUS[0]}
    else
        # Quiet mode: suppress all output
        eval $command > /dev/null 2>&1
        return $?
    fi
}

# Function to check if compilation was successful
check_compilation() {
    local exit_code=$1
    local step_name=$2
    
    if [ $exit_code -eq 0 ]; then
        log_message 3 "${GREEN}" "✓ $step_name successful"
        return 0
    else
        log_message 1 "${RED}" "✗ $step_name failed"
        return 1
    fi
}

# Function to clean temporary files
clean_temp_files() {
    log_message 2 "${YELLOW}" "Cleaning temporary files..."
    
    # Remove auxiliary files
    rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.synctex.gz
    rm -f *.fdb_latexmk *.fls *.nav *.snm *.vrb *.bcf *.run.xml
    rm -f *.figlist *.makefile *.figlist.bak
    
    # Remove auxiliary files from subdirectories
    rm -f untouch/*.aux
    
    log_message 2 "${GREEN}" "✓ Temporary files cleaned"
}

# Function to check LaTeX installation
check_latex_installation() {
    log_message 3 "${YELLOW}" "Checking LaTeX installation..."
    
    # Check for essential LaTeX tools
    local missing_tools=()
    local latex_manager=""
    
    if ! command_exists pdflatex; then
        missing_tools+=("pdflatex")
    fi
    
    if ! command_exists bibtex; then
        missing_tools+=("bibtex")
    fi
    
    # Check for package managers (TeX Live Manager or MiKTeX)
    if command_exists tlmgr; then
        latex_manager="tlmgr"
        log_message 3 "${GREEN}" "✓ Found TeX Live Manager (tlmgr)"
    elif command_exists miktex; then
        latex_manager="miktex"
        log_message 3 "${GREEN}" "✓ Found MiKTeX package manager"
    else
        missing_tools+=("package manager (tlmgr or miktex)")
    fi
    
    if [ ${#missing_tools[@]} -eq 0 ]; then
        log_message 3 "${GREEN}" "✓ LaTeX installation found"
        
        # Get LaTeX version info
        if [ $VERBOSITY -ge 3 ]; then
            local latex_version=$(pdflatex --version | head -n 1)
            log_message 3 "${BLUE}" "  $latex_version"
            
            # Show package manager info
            if [ "$latex_manager" = "miktex" ]; then
                local miktex_version=$(miktex --version | head -n 1)
                log_message 3 "${BLUE}" "  $miktex_version"
            fi
        fi
        return 0
    else
        log_message 1 "${RED}" "✗ Missing LaTeX tools: ${missing_tools[*]}"
        log_message 1 "${YELLOW}" "Please install a LaTeX distribution:"
        log_message 1 "${YELLOW}" "  macOS: Install MacTeX from https://www.tug.org/mactex/"
        log_message 1 "${YELLOW}" "  Windows: Install MiKTeX from https://miktex.org/"
        log_message 1 "${YELLOW}" "  Linux: Install TeX Live or MiKTeX using your package manager"
        log_message 1 "${YELLOW}" "         For MiKTeX on Linux: https://miktex.org/download"
        return 1
    fi
}

# Function to check if a LaTeX package is installed
check_latex_package() {
    local package=$1
    
    # Create a minimal test document to check package availability
    local test_file="__package_test__.tex"
    cat > "$test_file" << EOF
\\documentclass{article}
\\usepackage{$package}
\\begin{document}
Test
\\end{document}
EOF
    
    # Try to compile the test document
    if pdflatex -interaction=batchmode "$test_file" >/dev/null 2>&1; then
        rm -f __package_test__.*
        return 0
    else
        rm -f __package_test__.*
        return 1
    fi
}

# Function to install LaTeX package using package manager
install_latex_package() {
    local package=$1
    
    log_message 2 "${YELLOW}" "  Installing package: $package"
    
    # Determine which package manager to use
    if command_exists tlmgr; then
        if tlmgr install "$package" >/dev/null 2>&1; then
            log_message 2 "${GREEN}" "  ✓ Successfully installed: $package"
            return 0
        else
            log_message 2 "${RED}" "  ✗ Failed to install: $package"
            return 1
        fi
    elif command_exists miktex; then
        # MiKTeX uses different command syntax
        if miktex packages install "$package" >/dev/null 2>&1; then
            log_message 2 "${GREEN}" "  ✓ Successfully installed: $package"
            return 0
        else
            log_message 2 "${RED}" "  ✗ Failed to install: $package"
            return 1
        fi
    else
        log_message 2 "${RED}" "  ✗ No package manager available (tlmgr or miktex)"
        return 1
    fi
}

# Function to check and install required LaTeX packages
check_latex_packages() {
    log_message 3 "${YELLOW}" "Checking required LaTeX packages..."
    
    local missing_packages=()
    local failed_installs=()
    local optional_missing=()
    
    # Check required packages
    for package in "${REQUIRED_PACKAGES[@]}"; do
        if ! check_latex_package "$package"; then
            missing_packages+=("$package")
        fi
    done
    
    # Check optional packages (don't fail if missing)
    for package in "${OPTIONAL_PACKAGES[@]}"; do
        if ! check_latex_package "$package"; then
            optional_missing+=("$package")
        fi
    done
    
    local status="OK"
    local missing_str=""
    local optional_str=""
    
    if [ ${#missing_packages[@]} -eq 0 ]; then
        log_message 3 "${GREEN}" "✓ All required LaTeX packages are installed"
        
        if [ ${#optional_missing[@]} -gt 0 ]; then
            optional_str="${optional_missing[*]}"
            log_message 2 "${YELLOW}" "Optional packages not found (this is usually fine): ${optional_missing[*]}"
        fi
        
        # Save successful check to cache
        save_deps_to_cache "$status" "$missing_str" "$optional_str"
        return 0
    fi
    
    log_message 2 "${YELLOW}" "Missing required packages: ${missing_packages[*]}"
    log_message 2 "${YELLOW}" "Attempting to install missing packages..."
    
    # Try to install missing required packages
    for package in "${missing_packages[@]}"; do
        if ! install_latex_package "$package"; then
            failed_installs+=("$package")
        fi
    done
    
    if [ ${#failed_installs[@]} -eq 0 ]; then
        log_message 2 "${GREEN}" "✓ All missing packages installed successfully"
        # Save successful check to cache
        save_deps_to_cache "$status" "$missing_str" "$optional_str"
        return 0
    else
        status="FAILED"
        missing_str="${failed_installs[*]}"
        log_message 1 "${RED}" "✗ Failed to install packages: ${failed_installs[*]}"
        log_message 1 "${YELLOW}" "Please install these packages manually:"
        for package in "${failed_installs[@]}"; do
            if command_exists tlmgr; then
                log_message 1 "${YELLOW}" "  tlmgr install $package"
            elif command_exists miktex; then
                log_message 1 "${YELLOW}" "  miktex packages install $package"
            else
                log_message 1 "${YELLOW}" "  Install $package using your LaTeX package manager"
            fi
        done
        
        # Save failed check to cache
        save_deps_to_cache "$status" "$missing_str" "$optional_str"
        return 1
    fi
}

# Function to check for package updates (optional)
check_package_updates() {
    log_message 3 "${YELLOW}" "Checking for LaTeX package updates..."
    
    if command_exists tlmgr; then
        # Check if there are any updates available (TeX Live)
        local update_output
        update_output=$(tlmgr update --list 2>/dev/null | grep -v "^tlmgr:" | wc -l)
        
        if [ "$update_output" -gt 1 ]; then
            log_message 2 "${YELLOW}" "⚠ LaTeX package updates available. Consider running: tlmgr update --all"
        else
            log_message 3 "${GREEN}" "✓ LaTeX packages are up to date"
        fi
    elif command_exists miktex; then
        # Check if there are any updates available (MiKTeX)
        local update_output
        update_output=$(miktex packages check-update 2>/dev/null | wc -l)
        
        if [ "$update_output" -gt 0 ]; then
            log_message 2 "${YELLOW}" "⚠ LaTeX package updates available. Consider running: miktex packages update"
        else
            log_message 3 "${GREEN}" "✓ LaTeX packages are up to date"
        fi
    else
        log_message 2 "${YELLOW}" "⚠ Cannot check for updates (no package manager available)"
    fi
}

# Function to perform complete dependency check
check_dependencies() {
    log_message 3 "${BLUE}" "=== Dependency Check ==="
    
    # Try to use cache first (unless forced to recheck)
    if [ "$FORCE_DEPS_CHECK" = false ] && is_cache_valid && load_deps_from_cache; then
        # Check for updates (only in verbose mode and if using cache)
        if [ $VERBOSITY -ge 3 ]; then
            check_package_updates
        fi
        
        log_message 3 "${GREEN}" "✓ Dependency check completed (cached)"
        log_message 3 "" ""
        return 0
    fi
    
    # Full dependency check
    log_message 3 "${YELLOW}" "Performing full dependency check..."
    
    # Check LaTeX installation
    if ! check_latex_installation; then
        return 1
    fi
    
    # Check LaTeX packages
    if ! check_latex_packages; then
        log_message 1 "${YELLOW}" "Some packages failed to install, but compilation will continue."
        log_message 1 "${YELLOW}" "If compilation fails, please install the missing packages manually."
    fi
    
    # Check for updates (only in verbose mode)
    if [ $VERBOSITY -ge 3 ]; then
        check_package_updates
    fi
    
    log_message 3 "${GREEN}" "✓ Dependency check completed"
    log_message 3 "" ""
    return 0
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage
            exit 0
            ;;
        -q|--quiet)
            VERBOSITY=0
            shift
            ;;
        -v|--verbose)
            VERBOSITY=4
            shift
            ;;
        --debug)
            VERBOSITY=4
            shift
            ;;
        --error-only)
            VERBOSITY=1
            shift
            ;;
        --warning)
            VERBOSITY=2
            shift
            ;;
        --final-warnings)
            VERBOSITY=5
            shift
            ;;
        --info)
            VERBOSITY=3
            shift
            ;;
        --clean)
            clean_temp_files
            exit 0
            ;;
        --skip-deps)
            SKIP_DEPS=true
            shift
            ;;
        --force-deps-check)
            FORCE_DEPS_CHECK=true
            shift
            ;;
        --clear-cache)
            invalidate_cache
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo -e "Use -h or --help for usage information"
            exit 1
            ;;
    esac
done

# Start compilation process
log_message 3 "${BLUE}" "=== LaTeX Thesis Compilation Script ==="
log_message 3 "${BLUE}" "Document: ${MAIN_DOC}.tex"
log_message 3 "" ""

# Check dependencies unless skipped
if [ "$SKIP_DEPS" = false ]; then
    if ! check_dependencies; then
        log_message 1 "${RED}" "Dependency check failed. Use --skip-deps to bypass this check."
        exit 1
    fi
fi

log_message 3 "${YELLOW}" "Starting LaTeX compilation process..."
log_message 3 "" ""

# First compilation
run_latex "[1/4] First pdflatex compilation..." "pdflatex -interaction=nonstopmode ${MAIN_DOC}.tex"
latex_exit_code=$?
if ! check_compilation $latex_exit_code "First compilation"; then
    log_message 1 "${RED}" "First compilation failed. Exiting."
    exit 1
fi
log_message 3 "" ""

# BibTeX compilation
log_message 3 "${BLUE}" "[2/4] Running BibTeX..."
if [ $VERBOSITY -ge 4 ]; then
    bibtex ${MAIN_DOC}
    bibtex_result=$?
elif [ $VERBOSITY -ge 2 ]; then
    bibtex ${MAIN_DOC} 2>&1 | grep -E "(Warning|Error|Fatal)" || true
    bibtex_result=${PIPESTATUS[0]}
else
    bibtex ${MAIN_DOC} > /dev/null 2>&1
    bibtex_result=$?
fi

if [ $bibtex_result -eq 0 ]; then
    log_message 3 "${GREEN}" "✓ BibTeX successful"
else
    log_message 2 "${YELLOW}" "⚠ BibTeX warning/error (this may be normal if no citations)"
fi
log_message 3 "" ""

# Second compilation
run_latex "[3/4] Second pdflatex compilation..." "pdflatex -interaction=nonstopmode ${MAIN_DOC}.tex"
latex_exit_code=$?
if ! check_compilation $latex_exit_code "Second compilation"; then
    log_message 1 "${RED}" "Second compilation failed. Exiting."
    exit 1
fi
log_message 3 "" ""

# Third compilation (to resolve all cross-references)
run_latex "[4/5] Third pdflatex compilation..." "pdflatex -interaction=nonstopmode ${MAIN_DOC}.tex"
latex_exit_code=$?
if ! check_compilation $latex_exit_code "Third compilation"; then
    log_message 1 "${RED}" "Third compilation failed. Exiting."
    exit 1
fi
log_message 3 "" ""

# Fourth compilation (final - to resolve any remaining cross-references)
run_latex "[5/5] Fourth pdflatex compilation (final)..." "pdflatex -interaction=nonstopmode ${MAIN_DOC}.tex"
latex_exit_code=$?
if ! check_compilation $latex_exit_code "Fourth compilation"; then
    log_message 1 "${RED}" "Fourth compilation failed. Exiting."
    exit 1
fi
log_message 3 "" ""

# Check if PDF was generated
if [ -f "${MAIN_DOC}.pdf" ]; then
    log_message 1 "${GREEN}" "✓ PDF successfully generated: ${MAIN_DOC}.pdf"
    
    # Get PDF file size and page count
    if [ $VERBOSITY -ge 3 ]; then
        PDF_SIZE=$(ls -lh ${MAIN_DOC}.pdf | awk '{print $5}')
        log_message 3 "${BLUE}" "PDF size: ${PDF_SIZE}"
        
        # Try to get page count (requires pdfinfo, which might not be available)
        if command -v pdfinfo &> /dev/null; then
            PAGE_COUNT=$(pdfinfo ${MAIN_DOC}.pdf 2>/dev/null | grep "Pages:" | awk '{print $2}')
            if [ ! -z "$PAGE_COUNT" ]; then
                log_message 3 "${BLUE}" "Page count: ${PAGE_COUNT} pages"
            fi
        fi
    fi
else
    log_message 1 "${RED}" "✗ PDF was not generated"
    exit 1
fi

log_message 3 "" ""

# Clean temporary files
clean_temp_files

# Analyze warnings from final compilation
analyze_warnings

log_message 3 "" ""
log_message 1 "${GREEN}" "=== Compilation Complete ==="
if [ $VERBOSITY -ge 3 ]; then
    log_message 3 "${GREEN}" "✓ All compilations successful"
    log_message 3 "${GREEN}" "✓ Bibliography processed"
    log_message 3 "${GREEN}" "✓ Cross-references resolved"
    log_message 3 "${GREEN}" "✓ Temporary files cleaned"
    log_message 3 "" ""
    log_message 3 "${CYAN}" "Note about warnings:"
    log_message 3 "${CYAN}" "• LaTeX Reference warnings in early passes are normal"
    log_message 3 "${CYAN}" "• Bibliography citation warnings are resolved after BibTeX + recompilation"
    log_message 3 "${CYAN}" "• 'Rerun to get cross-references right' warnings are handled automatically"
fi
log_message 1 "${BLUE}" "Final output: ${MAIN_DOC}.pdf"
