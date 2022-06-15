info=$1
if ["$info" = ""];
then info=":pencil: cdn assets update"
fi
git add -A
git commit -m "$info"
git push origin main