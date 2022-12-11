echo "Question-1-Which location has the maximum number of purchases been made?"
echo "The amount of purchase in the location that maximum number of purchases made in is "
cut -f5 -d, bank_transactions.csv \
  | sort \
  | uniq -c \
  | sort  \
  | tail -n 1


echo "Question-2-In the dataset provided, did females spend more than males, or vice versa?"

#NR>1 means count after 1st column
#F is for delimiter, to separete ',' our file is comma seperated file CSV

awk -F ',' '(NR>1) {a[$4] += $9} END{print("Total amount of transaction by female", a["F"]); print("The total amount of transaction by male", a["M"])}' bank_transactions.csv
echo "Female spends more than males."


MaleSpend=$(awk -F ',' '(NR>1) {a[$4] += $9} END{print(a["F"])}' bank_transactions.csv)
FemaleSpend=$(awk -F ',' '(NR>1) {a[$4] += $9} END{print(a["M"])}' bank_transactions.csv)

echo "Total amount of transaction by female": $FemaleSpend, "and The total amount of transaction by male": $MaleSpend



echo "Question-3-Report the customer with the highest average transaction amount in the dataset."

echo "The customer with highest average transaction amount in the dataset is "


awk '{total[$2]+=$9} END {for (key in total) {print key, total[key]/NR}}'  | sort -k2 -n -r| head -n 2 bank_transactions.csv

# sort numerically, -n   
#sort reverse order -r
#sort according to specified column, second column -k2
#NR: total Number of rows 
