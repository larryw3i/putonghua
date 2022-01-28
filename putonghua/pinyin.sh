
_args=("$@") # all parameters from terminal.

atempo=1.2
all_pinyin=($(ls pinyin.cp))

update_pinyin(){
    for f in ${all_pinyin[@]};
    do
        echo Y | ( ffmpeg -i ./pinyin.cp/$f -filter:a "atempo=$atempo" \
        -vn ./pinyin.new/$f )
    done
}

update_pinyin_5(){    
    pinyin_5=("${all_pinyin[@]:0:5}")
    for f in ${pinyin_5[@]};
    do
        echo Y | ( ffmpeg -i ./pinyin.cp/$f -filter:a "atempo=$atempo" \
        -vn ./pinyin.new/$f )
    done
}

cp_t_pinyin_dir(){
    cp -r piyin.new/  pinyin/
}

_up(){      update_pinyin;      }
_up5(){     update_pinyin_5;    }


${_args[0]}