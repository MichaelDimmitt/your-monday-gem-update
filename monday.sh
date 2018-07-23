## if git status has nothing tracked, this will return nothing!
for BRANCH in `git branch --list| cut -c 3-`; do git checkout $BRANCH -q; git status | grep 'staged'; done

## if git status is completely clean, this will return nothing!
# just dont have a branch with '(' in the name. 
for BRANCH in `git branch --list| cut -c 3-`; do git checkout $BRANCH -q; git status | grep '('; done
