# Commit Message Instructions for AI Tools

When generating commit messages, follow these guidelines:

## Format
```
<type>(<scope>): <description>

<body>

<footer>
```

## Rules
- **First line max 72 characters**
- **Use imperative mood** ("add" not "added")
- **Lowercase first letter**
- **No ending period**
- **Types**: feat, fix, docs, style, refactor, perf, test, chore, ci, build, revert, hotfix, release
- **Scope**: Optional, use component/file/area affected
- **Body**: Optional, explain what and why
- **Footer**: Optional, breaking changes and issue references

## Available Types
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Formatting, white-space, etc
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding tests
- `chore`: Maintenance tasks
- `ci`: CI/CD changes
- `build`: Build system changes
- `revert`: Revert previous commit
- `hotfix`: Critical production fix
- `release`: Version release

## Examples
- `feat(auth): add user login functionality`
- `fix(ui): resolve header alignment on mobile`
- `docs(readme): update installation guide`
- `style(css): format button component styling`
- `refactor(api): extract user validation logic`
- `perf(images): implement lazy loading`
- `test(auth): add login validation tests`
- `chore(deps): update dependencies to latest`
- `ci(github): add automated deployment`
- `build(webpack): optimize production bundle`

## Breaking Changes
Add `BREAKING CHANGE:` in footer for breaking changes.

## Issue References
Add `Closes #123` or `Fixes #123` in footer for issue references.

## AI Generation Prompt
When using AI tools (Copilot, GitLens), use this prompt:
"Generate a conventional commit message for the staged changes. Use format: <type>(<scope>): <description>. Available types: feat, fix, docs, style, refactor, perf, test, chore, ci, build, revert, hotfix, release. Keep under 72 characters, imperative mood, lowercase, no ending period."
