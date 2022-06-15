info=$1
if ["$info" = ""];
then info=":pencil: 初次提交"
fi
git add -A
git commit -m "$info"
git push origin main