# dotfiles-bash

Automates some annoying setup procedures for bash dotfiles and aliases, vim and vscode.

:warning: Execution of some helper tasks in run.sh may require superuser privileges. Check this code beforehand!

### 1. setup-bash

Sets softlinks to both .bashrc as well as .bash_aliases. Note that this might cause some annoyances if some content of interest is already present in either file, so you might as well simply copy-paste to the respective files.
The bash-prompt configuration looks something akin to this:

```
(myenv) myuser:~/m/m/mydirectory [mybranch]
└─$ _
```

with virtual-env, user, abbreviated path and git-branch all packed together and colored accordingly.

I personally like the line break in the prompt as compared to, say, powerline. While it uses up more vertical space in the terminal, it gives the eyes a clear and constant place to rest for the beginning of every new command prompt.

The used bash-aliases span trivial matter such as frequent typos (sl vs ls), abbreviations and introduces some useful grep commands.

### 2. setup-vim

Installs Neovim along with some useful plugins (NerdTree, gruvbox colortheme). Sets softlinks to the respective .vimrc and init.vim files and makes nvim the default git editor.
