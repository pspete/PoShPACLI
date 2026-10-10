# Contributing

All contributions welcomed and are appreciated.

## Module Conventions

### PowerShell Styleguide

Use the standard *Verb*-*Noun* convention, and only use approved verbs.

Public functions use external help: add or update the command's markdown file in [docs/collections/_commands](docs/collections/_commands), which is the source of truth for `Get-Help`.

Every public function needs a Pester test file in [Tests](Tests).

[K&R (One True Brace Style variant)](https://github.com/PoshCode/PowerShellPracticeAndStyle/issues/81) preferred.

### Module Structure

The [Public](PoShPACLI/Public/) directory structure is based on the structure of the official CyberArk PACLI documentation.
Any code exposing documented methods of the PACLI utility must exist in the folder relevant to the method area (UserManagement, Safes, FoldersFiles etc.).

Any helper functions, consumed by other functions of the module must exist in the [Private](PoShPACLI/Private/) directory.

## Pull Requests

When submitting a Pull Request, automated tasks will run in GitHub Actions.

- The [`Pester`][pester-repo] tests for the module will run.
- Code coverage metrics for the module will be determined.
- Describe the change under `## Unreleased` in [CHANGELOG.md](CHANGELOG.md); the version number is set from these notes (there is no need to change it manually).
- Once code is merged into the `master` branch, and all tests pass, the module is automatically published to the PowerShell Gallery and tagged as a Release on GitHub.
  - No PR's should be submitted to the master branch; submitting to the Dev branch allows for required tests & documentation to be updated prior to any code release.

## Contributing Code

- Fork the repo.
- Push your changes to your fork.
- Write a [good commit message][commit]
- Submit a pull request to the [Dev Branch][dev-branch]
  - Keep pull requests limited to a single issue
  - Discussion, or necessary changes may be needed before merging the contribution.

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pester-repo]: https://github.com/pester/Pester
[dev-branch]: https://github.com/pspete/PoShPACLI/tree/dev
