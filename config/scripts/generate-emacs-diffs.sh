#!/bin/sh

clean_emacs_trash_files(){
    cd $1 \
    && find . -name '*~' -delete \
    && find . -name '*.el#' -delete
}

diff_lisp(){
    echo -e "\nLisp Directory \n" >> ~/emacs-generated.diff \
    && diff -r ~/Github/luiznux/emacs.d/.emacs.d/lisp ~/.emacs.d/lisp >> ~/emacs-generated.diff
}

diff_emojis(){
    echo -e "\nEmojis Directory\n" >> ~/emacs-generated.diff \
    && diff -r ~/Github/luiznux/emacs.d/.emacs.d/emojis ~/.emacs.d/emojis >> ~/emacs-generated.diff
}

diff_snippets(){
    echo -e "\nSnippets Directory\n" >> ~/emacs-generated.diff \
    && diff -r ~/Github/luiznux/emacs.d/.emacs.d/snippets ~/.emacs.d/snippets >> ~/emacs-generated.diff
}

diff_early_init(){
    echo -e "\nEarly-nit.el File\n" >> ~/emacs-generated.diff \
    && diff ~/Github/luiznux/emacs.d/.emacs.d/early-init.el ~/.emacs.d/early-init.el >> ~/emacs-generated.diff
}

diff_init(){
    echo -e "\nInit.el File\n" >> ~/emacs-generated.diff \
    && diff ~/Github/luiznux/emacs.d/.emacs.d/init.el ~/.emacs.d/init.el >> ~/emacs-generated.diff
}


### MAIN ###
echo "Cleaning emacs junk files:"
clean_emacs_trash_files ~/.emacs.d
clean_emacs_trash_files ~/Github/luiznux/emacs.d/.emacs.d
echo "Done!"

echo "Generate Diffs"
cd ~/
rm ~/emacs-generated.diff
touch ~/emacs-generated.diff

diff_lisp
diff_emojis
diff_snippets
diff_early_init
diff_init

echo "Diffs genereted to emacs-generated.diff file!"
echo "Done!"
