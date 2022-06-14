git clone git@github.com:yuryMarket/internship.git
cd internship
mkdir Task1
cd Task1
touch README.md
git add .
git commit -m "Add README in Task1"
git push
git branch dev
git checkout dev
touch Test1.txt
git add .
git commit -m "Add test1 file"
git push origin dev
git branch yury-new_feature
git checkout yury-new_feature
cd ..
touch README.md
git status
cd Task1
touch .gitignore
cat >> .gitignore
.*
!.gitignore
^D 
git add .
git add ../README.md
git commit -m "Add .gitignore"
git push origin yury-new_feature
create Pull Request to the dev branch
merge yury-new_feature branch with the dev branch
create Pull Request to the main branch
merge dev with the main branch
echo "Hey,Dude" > README.md
git add .
git commit -m "Edit README"
git log
git revert 81641919cf3b8d74e1a581b80df0e59443f98e04
git log
git checkout main
touch log.txt
git push origin --delete yury-new_feature
git branch -D yury-new_feature
git checkout dev
touch git_commands.md
git add .
git commit -m "add git_commands.md "
git push origin dev
