#!/bin/bash
##c important! all my zsh function
#Fri Dec  9 17:05:06 CST 2022

export FZF_DEFAULT_COMMAND='fd . -tf -d 1 '
#fdi()
#{
#  printf '%s\n' "fd  -H -I "
#  fd  -H -I
#}
listen(){
netstat -tulpn | grep LISTEN
}
dstop(){
docker stop $(docker ps -a -q)
}
wslp(){
wslpath -w $PWD | clip.exe
}
dr(){
  docker run -i -t "$1"
}
h1(){
  history 1 |tac |cut -c 1-7 --complement | nvim -
}
all(){
  cd /mnt/c/all
}
h(){
  history 1  |cut -c 1-7 --complement | tail -n20
}
hst()
{  
  history -$1 -1
}
env() 
{
  printenv | nvim
}

hs() 
{
hst 200| tac | nvim -
}

func()
{
  nvim ~/functions.sh
}
myb()
{
esbuild "$1"  --platform=node --target=esnext --outdir=build --format=cjs
}
nkill()
{
  printf '%s\n' "pgrep node | xargs kill -9"
pgrep node | xargs kill -9
}

jser()
{
fdm -ejs | xargs -r rg -i --max-count 2 "$1"
}
house()
{
cd /mnt/c/projects/house/
nvim /mnt/c/projects/house/todos.txt
}

gitweb()
{
#py script to web format git remote -v 
#depends on /mnt/c/projects/script/gitr.py
gitr.py $(git ls-remote --get-url)
}
gitp()
  #quick commit and push
{
git add -A && git commit  -am "more example" && git push
}
wintol()
{
printf '%s\n' "C:\Users\YourUsername" | sed 's.C:.mnt\/c.' | sed 's.\\./.g'
}
allBigs(){
  #general find bigg file
(cd /mnt/c && fdi --size +30m -x ls -lhrt  > /mnt/c/all/bigC 2>&1 &)
}
myr(){
  nvim /mnt/c/projects/recent.txt
}
lintow() {
  #send linux file path to window vim
#  printf '%s\n' "$1"
#  printf '%s\n' "$1" | sed 's.C:./mnt/c.g' | sed 's.\\./.g'
#wintoL $(fd -a iv)
printf "$(fdm -a $1)" | sed 's|\/mnt\/c|c\:|' | sed 's|\/|\\|g' | nvim -
}
wpwd() {
  #clip path window windows
  printf '%s\n' "' pwd | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g'"
  pwd | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g'
  pwd | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g' | cl

}

wone() {
  #takes linux file and clips window path
  echo "$1" | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g' | cl
  echo "$1" | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g' 
}
bigGit() {
  #crazy function to find big git commit
git rev-list --objects --all |\n  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | sed -n 's/^blob //p' | sort --numeric-sort --key=2 | cut -c 1-12,41- | $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest 
}

big() {
  (fdi --size +10m | xargs ls -lhrt | awk '{ print $5 " :  " $9 }' >big)
}
revparse() {
  printf '%s\n' "git rev-parse --abbrev-ref head --show-toplevel"
  git rev-parse --abbrev-ref HEAD --show-toplevel
}
psa() {
  printf '%s\n' "ps -a"
  ps -a
}
kills() {
  ps aux | awk '{print $11 $12 $13 "     kill -9 " $2 }' | nvim -
}
dud() {
  (duh >"$(date | sed 's/\s/_/g' | sed 's/_C.*//g')".txt 2>&1 &)
}
duc() {
  (du -sh -- * | sort -rh >"/mnt/c/all/$(date | sed 's/\s/_/g' | sed 's/_C.*//g')".txt 2>&1 &)
}
killst() {
  pgrep node | xargs kill -9 && (npm run server >jserver.txt 2>&1 &)
}
pkill() {
  pgrep "$1" | xargs kill -9
}
mcut() {
  printf '%s\n' 'ffmpeg -ss 90 -i "$1" -acodec copy o$1'
  ffmpeg -ss "$1" -i "$2" -acodec copy o"$1"
}
dpost() {
  cat db.json | jq 'del(.posts[] )' >temp && mv temp db.json
}
lsd() {
  ls "$1" -lshrt
}

pretty () {
	npx js-beautify "$1" > tempx && mv tempx "p$1" && sed -i '/^\s*$/d' "p$1"
}

tid() {
  tidy "$1" >temp || mv temp "$1"
}
unq() {
  awk '!a[$0]++' "$1" >testfile.tmp && mv testfile.tmp "$1"
}
tw() {
  fdm --changed-within="$1"days | xargs ls -lhrt | awk '{ print $9 ": " $6 " " $7 " " $8}' | sort -k3
}
recv() {
  fdm --changed-within="$1"days | xargs ls -lhrt | awk '{ print $9 " " $6 " " $7 " " $8}' | tac | sort | nvim -
}

recf() {
  fdm --changed-within="$1"days | xargs ls -lhrt | awk '{ print $9 " " $6 " " $7 " " $8}' | tac | sort >/mnt/c/projects/left.txt
}
form() {
  fmt -w 120 "$1" | nvim -
}
myman() {
  cht.sh "$1" | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | nvim -
}
ppath() {
  echo "$PATH" | perl -pe 's/:/\n/g' | sort #! split path"
}
ds() {
  dirs -p >>~/xd
}
dsc() {
  awk '!a[$0]++' ~/xd >~/testfile.tmp && mv ~/testfile.tmp ~/xd | sed 's/^/cd /g' ~/xd | nvim -
}
pql() {
  echo "PGPASSWORD=stars1  psql -h localhost -p 5432 -U steff007 tempdb"
  PGPASSWORD=stars1 psql -L output.txt -h localhost -p 5432 -U steff007 tempdb
}

pqle() {
  echo "PGPASSWORD=stars1  psql -h localhost -p 5432 -U steff007 tempdb"
  PGPASSWORD=stars1 psql -L nOutput.txt -E -h localhost -p 5432 -U steff007 tempdb
}
gitinit() {
  gignore
  k='git init -b main && git add -A && git commit -m "Initial commit"'
  echo $k
  bash -c "$k"
}
qm() {
  ps -A --sort -rss -o comm,pmem | awk '
  NR == 1 { print; next }
  { a[$1] += $2 }
  END {
    for (i in a) {
      printf "%-15s\t%s\n", i, a[i] | "sort -rnk2";
    }
  }
'
}
deleteall() {
  k='find -mindepth 1 -maxdepth 1 -print0 | xargs -r0 rm -rf'
  echo "$k"
  bash -c "$k"
}
pyse() {
  fd -a -epy -E mcoding | xargs rg "$1"
}
qht() {
  k="wget https://raw.githubusercontent.com/wither7007/htmlTemplate/main/html/index.html && wget https://raw.githubusercontent.com/wither7007/htmlTemplate/main/html/style.css && wget https://raw.githubusercontent.com/wither7007/htmlTemplate/main/html/script.js && wget https://raw.githubusercontent.com/wither7007/htmlTemplate/main/html/.gitignore"
  bash -c "$k"
}

lib() {

  echo 21972086245722 | cl
}

rec() {
  fdi --changed-within="$1"days --ignore-file ~/.fdignore | sort | awk '{ FS = "\\/" } ; { print $1 }' | uniq
}

frec() {
  fdm --changed-within="$1"hours -x ls -lhr | cut -d' ' -f5-13
}

recf() {
  fdi --changed-within="$1"hours --ignore-file ~/.fdignore -x ls -lhr | cut -d' ' -f5-13
}
cputest() {
  sysbench cpu run >~/cputest/"$(date | sed 's/\s/_/g' | sed 's/_C.*//g')"cpu.txt
}

f2() {
  echo "fd -a -tf --ignore-file ~/.fdignore --changed-within 2d | xargs -r ls -lhrt| more"
  fd -I -a -tf --ignore-file ~/.fdignore --changed-within 2d | xargs -r ls -lhrt| more
}
wind() {
  fdi --ignore-file ~/.fdignore -a -d 2 "$1" | sed 's|\/mnt\/c|c\:|' | sed 's|\/|\\|g' | nvim -
}
winfile() {
  #convert linux name win for one arg
  fd -a $1 | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g'
  fd -a $1 | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g' | cl
}
ltv() {
  ls -lhrt | awk '{print $9}' | nvim -
}
winfi() {
  fdm -d 1 -a books.html | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g'
  fd -d 1 -a "$1" | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g' | cl
}
ltvs() {
  ls -lhrt | awk '{print $9, "--" $5}' | nvim -
}
esc() {
  cat "$1" | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | nvim -
}
myst() {
  stat "$1" --format='acc: %x mod: %y  change: %z'
}
sq3() {
  sqlite3 "$1" -cmd ".tables" -cmd ".mode column"
}
deci() {
  echo "$1" | rev | sed -E 's/([0-9]{3})/\1,/g' | rev
}
exd() {
  exiftool -j "$1" | jq '.[0] | { Description }' | sed 's/\\n/\n/g' | v - #!good description
}

pyclean() {
  find . -type f -name "*.py[co]" -delete
  find . -type d -name "__pycache__" -delete
}
gitree() {
  echo "git log --oneline --graph --decorate --all"
  git log --oneline --graph --decorate --all
}
#https://shallowsky.com/blog/linux/cmdline/sed-insert-commas.html
vman() {
  man "$1" | nvim -
}
windir() {
  pwd | sed 's.\/mnt\/c.c\:.' | sed 's.\/.\\.g' | v -
}
se() { history | rg -i "$1"; }
manv() { man "$1" | v -c 'set nonumber' -; }
gith() { git help "$1" | v -c 'set nonumber' -; }
#wi () { whereis "$1"}
ex() { exiftool -j "$1" | v -; }

gith() {
  git "$1" --help | nvim -
}
take() { mkdir -p -- "$1" && cd -P -- "$1" || exit; }
rgg() { rg "$1" /mnt/c/all/gcloud_his "$HISTFILE"; }

chah() {
  fd -H -I -tf -L --changed-within="$1"hours | rg -v "tld|conf|\.git|hyp|cache|\.local" | xargs stat -c "%n   %.19z" | sort | sed -e "s/[0-9]*\:.*00\///g"
}
cham() {
  fdm -tf -L --changed-within="$1"minutes |  xargs stat -c "%y/%n" | sort | sed -e "s/[0-9]*\:.*00\///g"
}
hit() {
  history | tail -n "$1"
}

#https://raw.githubusercontent.com/nickjj/dotfiles/master/.config/zsh/.aliases
vdiff() {
  if [ "${#}" -ne 2 ]; then

    printf "vdiff requires two arguments"
    echo "  comparing dirs:  vdiff dir_a dir_b"
    echo "  comparing files: vdiff file_a file_b"
    return 1
  fi

  local left="${1}"
  local right="${2}"

  if [ -d "${left}" ] && [ -d "${right}" ]; then
    nvim +"DirDiff ${left} ${right}"
  else
    nvim -d "${left}" "${right}"
  fi
}

gits() {
  printf '%s\n' "git status -vv | v -"
  read -r
  git status -vv | nvim -
}

glst() {
  printf '%s\n' "git log --stat | vim -"
  read -r
  #git log --stat | nvim -
}
he() {
  eval '$1 --help | nvim -'
}

hisf() {
  omz_history | cut -c 1-7 --complement >~/hf
}

awsq() {
  #awk '!a[$0]++' ~/.sqlite_history > testfile.tmp && mv testfile.tmp ~/.sqlite_history
  nvim ~/.sqlite_history -c "normal Gzz"
}
phis() {
  nvim ~/.python_history -c "normal Gzz"
}
nh() {
  nvim ~/.node_repl_history
}
gitshow() {
  printf '%s\n' "git show --stat --oneline HEAD"
  git show --stat --oneline HEAD
}
fday() {
  printf '%s\n' "find . -mtime -1 -ls | awk '{ print  \$11 }'"
  find . -mtime -1 -ls | awk '{ print  $11 }'
}
ii(){
  echo 'x'
}
mkcd() {
    mkdir -p $@ && cd $@;
}

export PATH=$PATH:/home/steff007/.local/bin
