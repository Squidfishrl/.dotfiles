if [[ tty =~ /dev/tty[1-6] ]]; then
    sudo chvt {1-9} 
else
    i3-msg workspace {1-9}
fi
