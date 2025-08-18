# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v2.0.0](https://github.com/HeyItsGilbert/vale-agentic/tree/v2.0.0) (2025-08-18)

### Major Features
- **Massive expansion of communal language detection** - Dramatically expanded from 31 to 167 comprehensive patterns
- **4x expansion** in communal detection patterns (21→86)
- **8x expansion** in agentic alternatives (10→81)

### New Pattern Categories
- **Passive/Hedged Accomplishments**: `tried to` → `executed`, `attempted to` → `completed`, `managed to` → `accomplished`
- **Uncertainty & Hedge Words**: `perhaps` → `recommend`, `I think` → `I recommend`, `I believe` → `I am confident`
- **Self-Deprecating Language**: `lucky` → `strategic`, `by chance` → `through analysis`, `accidentally` → `during investigation`
- **Collaborative Downplay**: `team effort` → `I coordinated`, `group achievement` → `I contributed to`
- **Apologetic & Permission-Seeking**: `sorry` → `recommend`, `unfortunately` → `however`, `I hope` → `I recommend`

### Improved Detection
- Now identifies **48 violations** in complex communal language patterns
- Enhanced coverage for performance reviews, cover letters, and professional communications
- Comprehensive testing with expanded fixture coverage

## [v1.0.0](https://github.com/HeyItsGilbert/vale-agentic/tree/v1.0.0) (2023-01-03)

### Initial Release
- Initial Vale style package for agentic language detection
- Basic communal language pattern detection (31 patterns)
- Core agentic vs communal language transformation suggestions
- Support for Vale >= 1.7.0
- Cucumber test suite with Aruba integration
- YAML validation and CI pipeline