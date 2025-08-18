# vale-agentic [![Build Status](https://img.shields.io/github/actions/workflow/status/HeyItsGilbert/vale-agentic/test.yaml?branch=main)](https://github.com/HeyItsGilbert/vale-agentic/actions/workflows/test.yaml) ![Vale version](https://img.shields.io/badge/vale-%3E%3D%20v1.7.0-blue.svg) ![license](https://img.shields.io/github/license/mashape/apistatus.svg)

A [Vale](https://github.com/errata-ai/vale) style package that helps you write more assertive, action-oriented language by identifying and suggesting alternatives to communal phrasing.

## What is Agentic Language?

**Agentic language** emphasizes personal agency, ownership, and direct action. Instead of using passive, communal, or uncertain phrasing, agentic language helps you communicate with confidence and clarity.

**Examples of transformations:**
- ❌ "I helped improve the system" → ✅ "I improved the system"  
- ❌ "I'm a team player" → ✅ "I collaborate effectively"
- ❌ "I facilitated discussions" → ✅ "I led discussions"
- ❌ "I think maybe we should..." → ✅ "I recommend we..."

This is especially valuable for performance reviews, cover letters, and professional communications where clear ownership and impact matter.

## Installation

> :exclamation: vale-agentic requires Vale >= **1.7.0**. :exclamation:

### Method 1: Download from Releases (Recommended)

1. Download the [latest release](https://github.com/HeyItsGilbert/vale-agentic/releases)
2. Extract the archive
3. Copy the `agentic` directory to your Vale `StylesPath`

### Method 2: Clone Repository

```bash
git clone https://github.com/HeyItsGilbert/vale-agentic.git
cp -r vale-agentic/agentic /path/to/your/styles/
```

### Method 3: Git Submodule

```bash
cd your-project
git submodule add https://github.com/HeyItsGilbert/vale-agentic.git styles/vale-agentic
# Link or copy the agentic directory to your StylesPath
```

## Configuration

Create or update your Vale configuration file (`.vale.ini` or `_vale.ini`):

```ini
# Basic configuration
StylesPath = styles
MinAlertLevel = suggestion

# Apply to markdown and text files
[*.{md,txt}]
BasedOnStyles = agentic

# For different file types
[*.rst]
BasedOnStyles = agentic

# Customize alert levels
[*.md]
BasedOnStyles = agentic
agentic.communal = warning
agentic.communal_alternative = suggestion
```

## Examples

### Before and After

**Original text:**
```markdown
I improved feature X by doing Y. I am known as a team player in org. I enjoy
facilitating thoughtful discussions.
```

**Vale output:**
```
example.md:1:3:agentic.communal:Consider replacing 'improved'. It is communal vs agentic.
example.md:1:50:agentic.communal:Consider replacing 'team player'. It is communal vs agentic.  
example.md:2:14:agentic.communal_alternative:Consider using 'energetic' instead of 'thoughtful'
```

**Revised text:**
```markdown
I enhanced feature X by implementing Y. I am known as a collaborative leader in the organization. I enjoy
leading energetic discussions.
```

### Common Issues Caught

| Communal Phrase | Issue | Suggested Alternative |
|-----------------|-------|----------------------|
| "I helped improve..." | Diminishes ownership | "I improved..." |
| "team player" | Vague, overused | "collaborative", "supportive" |
| "maybe we should..." | Lacks conviction | "I recommend...", "We should..." |
| "managed to..." | Implies difficulty | "successfully...", "achieved..." |
| "facilitated" | Passive role | "led", "directed", "guided" |

## Usage

### Command Line

```bash
# Check a single file
vale example.md

# Check all markdown files
vale *.md

# Get JSON output
vale --output=JSON example.md

# Focus on agentic rules only
vale --filter='agentic.*' example.md
```

### Integration with Editors

**VS Code:** Install the [Vale VS Code extension](https://marketplace.visualstudio.com/items?itemName=ChrisChinchilla.vale-vscode)

**Vim/Neovim:** Use with [ALE](https://github.com/dense-analysis/ale) or [coc-vale](https://github.com/josa42/coc-vale)

**Emacs:** Use [flycheck-vale](https://github.com/abingham/flycheck-vale)

## Rules Reference

### agentic.communal
Identifies words and phrases that diminish personal agency:
- `improved`, `helped`, `managed to`, `eventually`
- `team player`, `friendly`, `maybe`
- `seems`, `despite`, `actually`

### agentic.communal_alternative  
Suggests stronger alternatives:
- `help` → `assist`
- `caring` → `dynamic`
- `thoughtful` → `energetic`  
- `facilitated` → `lead`
- `collaborated` → `created`

## Troubleshooting

**Vale not finding the style:**
- Ensure the `agentic` directory is in your `StylesPath`
- Check that `.vale.ini` is in your project root or home directory
- Verify Vale version >= 1.7.0 with `vale --version`

**Too many/few alerts:**
- Adjust `MinAlertLevel` (suggestion, warning, error)
- Customize individual rule levels in your config
- Use `--filter` to focus on specific rules

## Contributing

Found a communal phrase we missed? Have a better alternative suggestion?

1. Fork the repository
2. Add test cases in `fixtures/`
3. Update the appropriate `.yml` rule file
4. Submit a pull request

## Related Projects

- [Vale](https://github.com/errata-ai/vale) - The extensible linter this style is built for
- [alex](https://github.com/get-alex/alex) - Catch insensitive, inconsiderate writing
- [write-good](https://github.com/btford/write-good) - Naive linter for English prose

## License

[MIT](LICENSE)
