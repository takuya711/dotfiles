if (!($args.length -eq 1))
{
echo "use like [textopdf.ps1 texfile]"
exit
}

$filename = $args[0]
$filename = $filename.Replace(".tex","")
$filename = $filename.Replace(".\","")

$temp = $filename + ".tex"

if (Test-Path ./$temp){

if (Test-Path ./images){
$images = $(Get-ChildItem ./images/*.* -include *.pdf).Fullname
}

for($i=0; $i -lt $images.Length; $i++){
extractbb.exe $images[$i]
}

extractbb $images
platex $temp
$temp = $filename + ".dvi"
dvipdfmx $temp
$temp = $filename + ".pdf"
Invoke-Item $temp
}

else{
echo "no tex file"
}