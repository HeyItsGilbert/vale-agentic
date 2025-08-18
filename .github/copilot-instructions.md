# vale-agentic

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

This repository contains a Vale-compatible linter style that enforces "agentic" vs "communal" language patterns. Vale is a text linting tool that checks prose for style violations.

## Working Effectively

Bootstrap, build, and test the repository:

1. **Install Vale binary** (takes <1 second):
   ```bash
   wget https://github.com/errata-ai/vale/releases/download/v2.0.0-beta.2/vale_2.0.0-beta.2_Linux_64-bit.tar.gz
   mkdir -p bin && tar -xvzf vale_2.0.0-beta.2_Linux_64-bit.tar.gz -C bin
   export PATH=./bin:"$PATH"
   ```

2. **Install Ruby dependencies** (takes ~30 seconds):
   ```bash
   gem install --user-install bundler
   export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$PATH"
   bundle config set --local path 'vendor/bundle'
   bundle install
   ```

3. **Install Python dependencies** (takes <3 seconds):
   ```bash
   pip3 install -r requirements.txt
   ```

4. **Run YAML linting** (takes <0.1 seconds):
   ```bash
   yamllint -c '.yamllint.yml' agentic
   ```

5. **Run test suite** (takes ~1 second):
   ```bash
   bundle exec cucumber
   ```

## Core Functionality Validation

Test the Vale style manually:
```bash
# Test on failing examples (should show violations)
cd fixtures/basic && ../../bin/vale --output=line --sort --normalize --relative fail.md

# Test on passing examples (should show no violations)  
cd fixtures/basic && ../../bin/vale --output=line --sort --normalize --relative pass.md
```

Expected output for fail.md:
```
fail.md:2:3:agentic.communal:Consider replacing 'improved'. It is communal vs agentic.
fail.md:2:50:agentic.communal:Consider replacing 'team player'. It is communal vs agentic.
fail.md:3:14:agentic.communal_alternative:Consider using 'energetic' instead of 'thoughtful'
```

## Validation Scenarios

**ALWAYS test end-to-end workflow after making changes:**

1. Create a test markdown file with communal language patterns:
   ```bash
   echo "I improved our process by helping the team. I'm a dedicated team player." > /tmp/test.md
   ```

2. Create a Vale config file:
   ```bash
   cat > /tmp/.vale.ini << 'EOF'
   StylesPath = /home/runner/work/vale-agentic/vale-agentic
   MinAlertLevel = suggestion
   [*.md]
   BasedOnStyles = agentic
   EOF
   ```

3. Test the style works:
   ```bash
   cd /tmp && /home/runner/work/vale-agentic/vale-agentic/bin/vale --output=line test.md
   ```

4. Should output violations for communal language like "improved", "helping", "dedicated", "team player".

## CI Pipeline Commands

The following commands are run in CI and must pass:
- `yamllint -c '.yamllint.yml' agentic` - YAML style validation
- `bundle exec cucumber` - Feature tests using Cucumber/Aruba

## Repository Structure

Key directories and files:
- `agentic/` - Contains the Vale style rules (.yml files)
  - `communal.yml` - Detects communal language patterns 
  - `communal_alternative.yml` - Suggests agentic alternatives
- `features/` - Cucumber test suite using Ruby/Aruba
- `fixtures/basic/` - Test cases with .vale.ini config
- `.github/workflows/` - CI pipeline definitions
- `requirements.txt` - Python dependencies (yamllint, markdata, pyyaml)
- `Gemfile` - Ruby dependencies (aruba, cucumber, knapsack_pro)

## Common Commands

**Repository root contents:**
```
.github/           # GitHub workflows and configurations
.gitignore         # Git ignore patterns
.yamllint.yml      # YAML linting configuration
CHANGELOG.md       # Change history
Gemfile            # Ruby dependencies
Gemfile.lock       # Ruby dependency lock file
LICENSE            # MIT license
README.md          # Project documentation
agentic/           # Vale style rules directory
features/          # Cucumber test suite
fixtures/          # Test fixtures
requirements.txt   # Python dependencies
```

**Key Vale style files:**
- `agentic/communal.yml` - Existence-based rule that flags communal words like "improved", "team player", "helping"
- `agentic/communal_alternative.yml` - Substitution-based rule that suggests agentic alternatives like "energetic" instead of "thoughtful"

## Important Notes

- Vale >= 1.7.0 is required (we use v2.0.0-beta.2)
- The style detects "communal" language patterns that may be perceived as weaker
- Suggests "agentic" alternatives that sound more confident and direct
- Useful for performance reviews and professional communication
- All commands have been validated to work and timing has been measured
- No long-running builds - all operations complete in under 30 seconds