#!/bin/bash

csv_file="test.csv"
output_file="params_valori.txt"

# Parsing righe csv
IFS=',' read -r -a chiavi < "$csv_file"
IFS=',' read -r -a valori < <(sed -n '2p' "$csv_file")

# creazione output file
echo "#!/bin/bash" > "$output_file"

for i in "${!chiavi[@]}"; do
    
	# Rimuove eventuali spazi bianchi dalle chiavi
    chiave_pulita=$(echo "${chiavi[$i]}" | sed 's/ //g')
    
    # Scrive le variabili chiave-valore nel file di output
    echo "export $chiave_pulita=\"${valori[$i]}\"" >> "$output_file"
done

# +x a output 
chmod +x "$output_file"

