INPUT=prod.csv
OLDIFS=$IFS
IFS=';'
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read Filename title category tags ipath price1 price2 price3
do
	
	#echo "Name : $Filename"> $Filename
	echo "+++"> $Filename
	echo "showonlyimage = true">> $Filename
	echo "draft = false" >> $Filename
	echo "image = \"$ipath\"" >> $Filename
	echo "date =\"$(date +"%FT%T%:z")\"">> $Filename
	echo "title = \"$title\"">> $Filename
	echo "categories = \"$category\"" >> $Filename
	echo "Tags = [$tags]" >> $Filename
	echo "+++">> $Filename
	echo "price : ₹450 per pound">> $Filename
	echo "<!--more-->" >> $Filename
	echo "![$title](/$ipath)" >> $Filename
	echo "* 1 pound cake price serves 8-10 persons : $price1" >> $Filename
	echo "* 2 pound cake price serves 10-20 persons : $price2" >> $Filename
	echo "* 3 pound cake price serves 20-30 persons : $price3" >> $Filename
	
done < $INPUT
IFS=$OLDIFS
