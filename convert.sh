#! /bin.sh

# 指定路径的图片转化为webp格式，使用前判断是否是文件！
function webpf() {
  input=$1;
  q=$2;

  if [[ ! "$input" ]]; then
    return 1;
  fi

  # if [[ ${input##*.} == "webp" ]]; then
  #   return 2;
  # fi

  output=${input%.*}".webp";
  # echo "output:"$output;

  if [[ -f "$output" ]]; then
    return 2;
  fi

  if [[ $q ]]; then
     # -quiet,don't print anything
     # -progress,report encoding progress
     # -lossless,有的JPG反而更大！
     # safename="$(echo $input | sed 's# #\\ #g')"
     # 作为参数的时候，带上双引号，这样可以传递有空格的参数！
     cwebp -q $q -quiet -metadata "all" -mt "$input" -o "$output";
     # echo $(stat "$input");
     echo "$output";
  else
     cwebp -quiet -metadata "all" -mt "$input" -o "$output";
  fi
}

function doconvert() {
  input="$1"; #http://www.cnblogs.com/cocowool/archive/2013/01/15/2861904.html
  # input="$(echo "$1" | sed s'/_-_/ /g')"
  q=$2;

  if [[ -f "$input" ]]; then
    # safename="$(echo $input | sed 's/ /_-_/g')"
    webpf "$input" 100;
  elif [[ -d "$input" ]]; then
    echo "convert directory:""$input""."
    files="$input/*";  #$(ls $input);有问题； filepath=$input"/"$file;
    # count=${#files[@]};
    for file in $files
      do
        if [[ ${file##*.} -ne "webp" ]]; then
          continue;
        fi
        # safename="$(echo $file | sed 's/ /_-_/g')"
        doconvert "$file" $q;
        num=num+1;
      done
  else
    echo "$input"" not exist..."
  fi
}

inputPath="$1";
if [[ ! "$inputPath" ]]; then
  inputPath="$PWD/pics";
fi
#参数中没有空格时， "$inputPath" 与 $inputPath 没区别；
doconvert "$inputPath" 100;
