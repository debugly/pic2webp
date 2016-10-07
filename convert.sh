#! /bin.sh

# 指定路径的图片转化为webp格式，使用前判断是否是文件！
function webpf() {
  input=$1;
  q=$2;

  if [[ ! $input ]]; then
    return 1;
  fi

  output=${input%.*}".webp";

  if [[ -f $output ]]; then
    return 2;
  fi

  if [[ $q ]]; then
     # -quiet,don't print anything
     # -progress,report encoding progress
     cwebp -q $q -quiet -mt -lossless $input -o $output;
  else
     cwebp -quiet -mt -lossless $input -o $output;
  fi
}

function doconvert() {
  input=$1;
  q=$2;

  if [[ -f $input ]]; then
    webpf $input 100;
  elif [[ -d $input ]]; then
    echo "input path is directory."
    files="$input/*";  #$(ls $input);有问题； filepath=$input"/"$file;
    for file in $files
      do
        doconvert $file $q;
      done
  else
    echo $input" not exist..."
  fi
}

inputPath=$1;
if [[ $inputPath ]]; then
   echo "handle input directory or file..."
else
   echo "handle current pics directory..."
   inputPath="$PWD/pics";
fi

doconvert $inputPath 100;
