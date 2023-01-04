# vale-agentic [![Build Status](https://img.shields.io/github/actions/workflow/status/HeyItsGilbert/vale-agentic/test.yaml?branch=main)](https://github.com/HeyItsGilbert/vale-agentic/actions/workflows/test.yaml) ![Vale version](https://img.shields.io/badge/vale-%3E%3D%20v1.7.0-blue.svg) ![license](https://img.shields.io/github/license/mashape/apistatus.svg)



This repository contains a [Vale-compatible](https://github.com/errata-ai/vale) implementation of the guidelines enforced by the `vale-agentic` ([LICENSE](https://github.com/HeyItsGilbert/vale-agentic/blob/main/LICENSE)) linter.

## Getting Started

> :exclamation: vale-agentic requires Vale >= **1.7.0**. :exclamation:

Download the [latest release](https://github.com/HeyItsGilbert/vale-agentic/releases), copy the "agentic" directory to your `StylesPath`, and include it in your configuration file:

```ini
# This goes in a file named either `.vale.ini` or `_vale.ini`.
StylesPath = path/to/some/directory
MinAlertLevel = suggestion # suggestion, warning or error

# Only Markdown and .txt files; change to whatever you're using.
[*.{md,txt}]
# List of styles to load.
BasedOnStyles = agentic
```

See [Usage](https://github.com/errata-ai/vale/#usage) for more information.
