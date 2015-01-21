if ($args.Length -eq 5)
{
$csvfile = $args[0]
$skipline = $args[1]
$endline = $args[2]
$xrow = $args[3]
$yrow = $args[4]

python C:\Users\Takuya\scripts\pycsvmod.py $csvfile $skipline $endline

$csvmod0 = $csvfile.Replace(".\","")
$csvmod = $csvmod0.Replace(".","_mod.")

py -2 C:\Users\Takuya\scripts\pyplot.py $csvmod $xrow $yrow

}

elseif ($args.Length -eq 4)
{
$csvfile = $args[0]
$skipline = $args[1]
$endline = $args[2]
$xrow = $args[3]

python C:\Users\Takuya\scripts\pycsvmod.py $csvfile $skipline $endline

$csvmod0 = $csvfile.Replace(".\","")
$csvmod = $csvmod0.Replace(".","_mod.")

py -2 C:\Users\Takuya\scripts\pyplot.py $csvmod $xrow

}

elseif ($args.Length -eq 3)
{
$csvfile = $args[0]
$skipline = $args[1]
$endline = $args[2]

python C:\Users\Takuya\scripts\pycsvmod.py $csvfile $skipline $endline

$csvmod0 = $csvfile.Replace(".\","")
$csvmod = $csvmod0.Replace(".","_mod.")

py -2 C:\Users\Takuya\scripts\pyplot.py $csvmod

}

else
{
echo "use like pyplot csvfile skipline endline [xrow] [yrow]"
exit
}
