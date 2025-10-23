# Git Configuration Guide for Trading Bot Pro Team

To ensure consistent line endings across Windows, macOS, and Linux environments:

## 🪟 Windows Developers
Run this once in your terminal:
```
git config --global core.autocrlf true
```
This makes Git convert LF to CRLF on checkout, and CRLF back to LF on commit.
Your local files will use Windows-style endings, while the repository stores LF.

## 🐧 macOS / Linux Developers
Run this command:
```
git config --global core.autocrlf input
```
This ensures Git only converts CRLF to LF on commit, preserving LF endings everywhere.

## ✅ Project Policy
- All source files (Python, JS, YAML, Docker, Markdown) use LF in the repository.
- Windows users can safely work with CRLF locally due to autocrlf conversion.
- Binary files (PDF, ZIP, PNG, etc.) are never altered by Git.
- The `.gitattributes` file enforces consistent behavior for all developers and CI pipelines.

For more info: https://git-scm.com/docs/gitattributes
