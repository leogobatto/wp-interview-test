# Conventional Commits Guide

## How to Use in Your IDE

### 1. Recommended VS Code Extensions

Install the recommended extensions that will appear automatically:

* **Conventional Commits**: Assistant to help you create commits following the standard
* **GitLens**: Advanced Git visualization
* **Git Graph**: Graphical history view

### 2. Ways to Make Commits

#### Option 1: Via Integrated Command

```bash
npm run commit
# or
lando git-cz
```

#### Option 2: Via Conventional Commits Extension

1. Open the Command Palette (`Ctrl+Shift+P`)
2. Type "Conventional Commits"
3. Follow the interactive assistant

#### Option 3: Via Terminal with Template

```bash
git commit
# The .gitmessage template will be loaded automatically
```

#### Option 4: Via VS Code Snippets

* Type `cc-feat` + Tab for a new feature
* Type `cc-fix` + Tab for a bug fix
* Type `cc-docs` + Tab for documentation
* And so on...

### 3. Available Commit Types

| Type       | Description             | Example                                |
| ---------- | ----------------------- | -------------------------------------- |
| `feat`     | New feature             | `feat(auth): add social login`         |
| `fix`      | Bug fix                 | `fix(api): fix timeout error`          |
| `docs`     | Documentation           | `docs(readme): update install steps`   |
| `style`    | Code style changes      | `style(css): fix indentation`          |
| `refactor` | Code refactoring        | `refactor(utils): simplify validation` |
| `perf`     | Performance improvement | `perf(db): optimize user query`        |
| `test`     | Tests                   | `test(auth): add integration tests`    |
| `chore`    | Maintenance tasks       | `chore(deps): update dependencies`     |
| `ci`       | CI/CD configuration     | `ci(github): add deploy workflow`      |
| `build`    | Build-related changes   | `build(webpack): update config`        |

### 4. Commit Message Structure

```
<type>(<scope>): <description>

<optional body>

<optional footer>
```

**Full Example:**

```
feat(user-profile): add custom avatar

Allows users to upload a custom image
to use as a profile avatar.

Closes #123
```

### 5. Breaking Changes

For changes that break backward compatibility:

```
feat(api): change API response structure

BREAKING CHANGE: The API now returns
an object with data instead of a direct array.
```

### 6. Automatic Validation

The project is set up with:

* ✅ **Husky**: Git hooks
* ✅ **CommitLint**: Commit message validation
* ✅ **Lint-staged**: Linting only modified files

### 7. Useful Commands

```bash
# Interactive commit
npm run commit

# Check last commit message
lando commitlint-check

# Generate changelog
lando conventional-changelog

# Create release
npm run release
```

### 8. VS Code Configuration

Settings are located in `.vscode/settings.json`:

* Message validation enabled
* Predefined scopes for the project
* Character limit configured
* Integrated terminal setup

## Key Tips

1. **Use the imperative mood**: "add", not "added"
2. **Be concise**: First line max 72 characters
3. **Use consistent scopes**: core, theme, plugins, config, etc.
4. **Reference issues**: Use "Closes #123" or "Fixes #123"
5. **Breaking changes**: Always document in the footer

---
