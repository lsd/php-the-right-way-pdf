#!/bin/sh
# This uses pandoc to convert PHP-The-Right-Way to a PDF.
# github.com/lsd for this + generated PDFs / ePubs / Mobi / etc.

echo "----------------\n"
echo "Make sure you are in the root file of the SOURCE of the site."
echo "Make sure pandoc and jekyll are installed"
echo "For example, ..."
echo "$ git clone https://github.com/codeguy/php-the-right-way.git"
echo "$ cd php-the-right-way/"
echo "$ cat CNAME"
echo "$ sh build-html-to-pdf.sh"
echo "----------------\n"

echo "Starting Jekyll build and then serving. OK? (any key or ctrl+c to quit)"
read

jekyll build
jekyll serve

echo "Assuming site is on localhost:4000. Now running pandoc to generate single HTML."
echo "this: pandoc -s -S --toc -c styles/all.css http://localhost:4000 -o php-the-right-way-single-html.html"
echo "... OK?"
read
pandoc -s -S --toc -c styles/all.css http://localhost:4000 -o php-the-right-way-single-html.html

echo "Edit the outputted HTML file."
echo "Save it and then hit any key to continue."
echo "(CTRL+C to terminate at any time)"
read

echo "Finished? Use this step to remove unwanted things or fix formatting in the HTML"
echo "Examples of issues: "
echo "* There are 2 ToC (remove --toc flag above or manually remove the HTML for one of the ToC)"
echo "* I added <style>body { margin: 1em }</style> to my copy"
echo "* I added <style>a { color: rgb(0, 96, 172); }</style> to my copy"
echo "* I removed some pages I don't need (contribute, disclaimer, etc.."
echo "Anyway, last warning before making PDF. Proceed? (CTRL+C to die)"
read


