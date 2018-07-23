## if git status has nothing tracked, this will return nothing!
# set up the environment
setEnvironment() {
echo 'set environment initiated'
touch test.txt # untracked
touch blah.txt # tracked but not staged
touch foo.txt  # tracked and staged
git add -N blah.txt
git add foo.txt
}

iDoStuff() {
echo 'do stuff function initiated'

for BRANCH in `git branch --list| cut -c 3-`; do git checkout $BRANCH -q; git status | grep 'staged'; done;

## if git status is completely clean, this will return nothing!
# just dont have a branch with '(' in the name.
for BRANCH in `git branch --list| cut -c 3-`; do git checkout $BRANCH -q; git status | grep '('; done;
}
cleanEnvironment(){
echo 'clean environment initiated'
git reset HEAD foo.txt >&/dev/null && git rm --cached blah.txt >&/dev/null
rm blah.txt foo.txt test.txt >&/dev/null
}

setEnvironment
iDoStuff
cleanEnvironment
iDoStuff
