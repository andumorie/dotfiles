
# Starting from scratch

If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:

```
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

- The first line creates a folder ~/.dotfiles which is a Git bare repository that will track our files.
- Then we create an alias config which we will use instead of the regular git when we want to interact with our configuration repository.
- We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type config status and other commands later, files you are not interested in tracking will not show up as untracked.
- Also you can add the alias definition by hand to your .bashrc or use the the fourth line provided for convenience.

&nbsp;

I've packaged the above lines into a gist so that you can set things up with:
```
curl -Lks https://gist.githubusercontent.com/andumorie/ff343e42cdc578ff2526165255a121c7/raw/6022e5da6d3b96dc2295bf9e4d54fdfed0e95cc7/dotfiles-init | /bin/bash
```
&nbsp;

After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing git with your newly created config alias, like:

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

&nbsp;

# Installing your dotfiles onto a new system (or migrate to this setup)

If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```
echo ".dotfiles" >> .gitignore
```

Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

```
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Checkout the actual content from the bare repository to your $HOME:

```
config checkout
```

The step above might fail with a message like:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Re-run the check out if you had problems:

```
config checkout
```
Set the flag showUntrackedFiles to no on this specific (local) repository:

```
config config --local status.showUntrackedFiles no
```
You're done! From now on you can now type config commands to add and update your dotfiles:

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

&nbsp;

Again, as a shortcut, you can run the following command on any new machine where you want to setup the dotfiles:
```
curl -Lks https://gist.githubusercontent.com/andumorie/ff343e42cdc578ff2526165255a121c7/raw/6022e5da6d3b96dc2295bf9e4d54fdfed0e95cc7/dotfiles-install | /bin/bash
```
