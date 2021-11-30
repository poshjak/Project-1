#list variables
States=(
   'Texas'
   'Washington DC'
   'Florida'
   'Hawaii'
   'Colorado'
)

#print out states
for state in ${States[@]};
do
  if [ $state = 'Hawaii' ]
  then 
      echo 'Hawaii is the best'
  else
      echo 'Hawaii kinda sucks my g'
  fi
done 

numbers=('1' '2' '3' '4' '5' '6' '7' '8' '9')

#print numbers
for no in ${numbers[@]};
do
  if [ $no = '3' ] || [ $no = '5' ] || [ $no = '7' ]
then 
  echo $no
fi 
done
