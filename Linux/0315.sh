grep 02 0315_Dealer_schedule | grep PM | awk -F" " '{print $1,$2,$3,$4,$5,$6,$7,$8}' >> Dealers_working_during_losses
