
#!/bin/sh

# Pass a file in as the first argument on the command line and the lines as second argument
file=$1
lines=$2

# Get the header file out
header=$(head -1 $file)

# Separate the data from the header
tail -n +2 $file > split.tmp

# Split the data into 1000 lines per file (change as you wish)
split -l $lines split.tmp split

# Append the header back into each file from split 
for part in `ls -1 split*`
do
  printf "%s\n%s" "$header" "`cat $part`" > $part
done