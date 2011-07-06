#/usr/bin/sh

printHeader() {
  echo "++++++++++++++++++++++++++++++++++++++++"
  echo $1
  echo "++++++++++++++++++++++++++++++++++++++++"
}

printHeader "Cleaning CSS File: $1"

# CP FILE
newFile="$1.bk"
cp $1 $newFile

perl -pi -e 's/[\s\t]*line\-height\s*:\s*\d*(\.\d*)?(px|em);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*font\-weight\s*:\s*(normal);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*font\-style\s*:\s*(normal);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*font\-variant\s*:\s*(normal);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*text\-align\s*:\s*(left|justify);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*text\-transform\s*:\s*(uppercase);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*color\s*:\s*(#000000);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*text\-decoration\s*:\s*(none);[\s\t]*//g' $1
perl -pi -e 's/[\s\t]*writing\-mode\s*:\s*(horizontal\-tb);[\s\t]*//g' $1

printHeader "Diffing Starting/Ending Files: $1 $newFile > $1.diff"
diff $1 $newFile > "$1.diff"
