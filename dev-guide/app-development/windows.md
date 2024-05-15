
# Windows

## Software

Install the following software
* VS Code
* VS Code extensions:
  - ESLint (required)
  - sort-imports (required)
  - Highlight Trailing White Spaces (required)
  - Git lens (recommended)
  - Codeium AI / Gemini(recommended)

* Github for Windows, including Git Bash
* NodeJS (latest LTS. Currently V20) (https://nodejs.org/en/download). If you need to manage multiple versions, you can use the [NVM](https://github.com/nvm-sh/nvm) tool.


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
* Right click on newly cloned repo
* Select 'Open in Visual Studio Code'

## 3. VS Code

Running the project in PowerShell is not supported. In order to have a unified experience, we use Git Bash in Windows. VS Code has already been configured to use Git Bash by default in the `settings.json` file.

* Terminal / New Terminal
* Select Git bash by clicking on the arrow down next to the (+) button
* type `npm install` and wait for the command to complete

## Troubleshooting

Error message | Solution
--- | ---
Error: Cannot find module @rollup/rollup-win32-x64-msvc. npm has a bug related to optional dependencies (https://github.com/npm/cli/issues/4828). Please try `npm i` again after removing both package-lock.json and node_modules directory. | This can happen when the package-lock.json has been created on a Linux environament. Solution: remove both package-lock.json and node_modules directory and run `npm i` again. This will include the optional dependency @rollup/rollup-win32-x64-msvc for windows. Then create a pull request and merge it into the main codebase.
npm ERR! enoent spawn bash ENOENT | This is likely due to npm running in PowerShell, which is not supported in PoziApp. Please use Git Bash instead.