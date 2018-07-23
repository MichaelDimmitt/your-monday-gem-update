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

## if git status has files being tracked
output1=$(for BRANCH in `git branch --list| cut -c 3-`; do git checkout $BRANCH -q; git status | grep 'staged'; done;)

## if git status is completely clean, this will return nothing!
# just dont have a branch with '(' in the name.
output2=$(for BRANCH in `git branch --list| cut -c 3-`; do git checkout $BRANCH -q; git status | grep '('; done;)
if [ -z "$output1" ];
then
      echo "1 is empty"
      echo "no files are being tracked lets check untracked next"
else
      echo "1 is NOT empty"
      echo "you have tracked files that need to be addressed! 😱"
fi
if [ -z "$output2" ];
then
      echo "2 is empty"
      echo "git directory is completely clean, good to go!"
else
      echo "2 is NOT empty"
      echo "you have untracked or tracked files that need to be addressed! 😱 "
fi
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
echo 'done'
