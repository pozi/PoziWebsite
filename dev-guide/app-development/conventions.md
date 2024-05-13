
# Conventions

## Code

VS Code settings are stored in `.vscode/settings.json` and specific to PoziApp.

General code conventions

## Git

**Branch naming**:
* `maintenance-<activitity>`: for admin related things like upgrading dependencies, changes to our github actions, etc
* `feature-<activity>`: for new functionality, like adding a print button for example
* `bugfix-<activity>`: for bug fixes

**Commit messages**:
- Use imperative tense. E.g. 'Add new print button'
- If more text is required, leave empty line and add description

**Workflow**:
* Create a branch for each activity `git checkout -b <branch-name>`
* Commit changes `git commit -a`
  * Text editor will open, add the commit message to the top of this file followed by a blank line.  If further detail is required, add more information after the blank line.
* Push to remote `git push`
* Create PR on GitHub (a version of Pozi will be built automatically on `https://staging.pozi.com/<branch-name/>`), add a reviewer
* Add link to PR in relevant Trello card
