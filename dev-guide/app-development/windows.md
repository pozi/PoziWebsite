
# Windows

## Software

Install the following software
* VS Code
* VS Code extensions:
  - ESLint (required)
  - sort-imports (required)
  - Highlight Trailing White Spaces (required)
  - Git lens (recommended)
  - Codeium AI (recommended)

* Github for Windows, including Git Bash
* NodeJS (latest LTS. Currently V20) (https://nodejs.org/en/download)


## Steps

## 1. Github online

* Visit PoziApp on github.com: https://github.com/pozi/PoziApp
* Click on `Code` button and select `Clone` and `https`.
* Copy URL https://github.com/pozi/PoziApp.git

## 2. Github Desktop
* File/Clone repository
* Select URL
* paste URL above (https://github.com/pozi/PoziApp.git)
* Select local path (e.g. %USERPROFILE%\git\pozi)
* Click on `Clone`
* Right click on newly clone repo
* Select 'Open in Visual Studio Code'

## VS Code
* Terminal / New Terminal
* Select Git bash by clicking on the arrow down next to the (+) button
* type `cd app` (this is where the actual project files live)
* type `npm install` and wait for the command to complete

## Conventions

### Code

VS Code settings are stored in `.vscode/settings.json` and specific to PoziApp.

General code conventions

### Git

**Branch naming**:
* `maintenance-<activitity>`: for admin related things like upgrading dependencies, changes to our github actions, etc
* `feature-<activity>`: for new functionality, like adding a print button for example
* `bugfix-<activity>`: for bug fixes

**Commit messages**:
- Use imperative tense. E.g. 'Add new print button'
- If more text is required, leave empty line and add description

**Workflow**:
* Create a branch for each activity
* Commit changes
* Push to remote
* Create PR on github (a version of Pozi will be built automatically on `https://staging.pozi.com/<branch-name/>`)
* Add link to PR in relevant Trello card


### Deploy & Create Release

It is possible and recommended to only deploy using GitHub.