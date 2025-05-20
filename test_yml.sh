#!/bin/bash -ue

#set -x
#set -u


declare -a values=()

while IFS=":" read -r key value; do
    key=$(echo "$key" | tr -d '"' | xargs)
    value=$(echo "$value" | tr -d '"' | xargs)
    case "$key" in
        "--randomSeed") values["r"]="$value" ;;
        "--attributeAlleleFrequency") values["a"]="$value" ;;
        "--prevalence") values["p"]="$value" ;;
        "--heritability") values["h"]="$value" ;;
        "--useOddsRatio") values["d"]="$value" ;;
        "--quantile_counts") values["q"]="$value" ;;
        "--population_counts") values["pp"]="$value" ;;
        "--trycount") values["t"]="$value" ;;
        "--proportion") values["f"]="$value" ;;
    esac
done < gametesM_dict.yml

echo "gametes -M \"--h ${values[h]:-""} --p ${values[p]:-""} --a ${values[a]:-""} --f ${values[f]:-""} --d ${values[d]:-""} -o test\" -p ${values[pp]:-""} -q ${values[q]:-""} -t ${values[t]:-""} -r ${values[r]:-""}"



