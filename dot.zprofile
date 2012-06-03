
export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=lv
export GREP_OPTIONS='--binary-files=without-match --exclude=.tags --exclude-dir=.git --exclude-dir=.svn --exclude=*~ --color=auto'
export PYTHONPATH=$HOME/local/lib/python2.7/site-packages

export GEM_HOME=$HOME/.gems
path=($path $GEM_HOME/bin)

xset dpms 600 0 0
nvidia-settings -a InitialPixmapPlacement=0 > /dev/null

if [ -f $HOME/.zshrc ]; then
    . $HOME/.zshrc
fi
