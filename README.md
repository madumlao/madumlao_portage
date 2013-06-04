madumlao_portage
================

my personal portage overlay, collecting various quirks and tools I use to keep portage up to date.

Description of my system:
- purely systemd
- gnome-shell
- unity via unity overlay
- no systemwide programming languages when possible
  - rely on rbenv, pyenv, phpenv, nenv, or equivalent tools to generate development environments
  - dependency packages of rbenv, pyenv, phpenv, etc.

Likely modifications to portage tree:
- hardwired dependencies of some ebuilds converted to USE flags
- add useful patches found on the net directly to the ebuild
