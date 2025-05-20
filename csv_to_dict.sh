#!/bin/bash

declare -A gametesm=(
    ["seed"]="--randomSeed"
    ["MAF_for_interacting_associates_attributes"]="--attributeAlleleFrequency"
    ["prevalence"]="--prevalence"
    ["heritability"]="--heritability"
    ["useOddsRatio"]="--useOddsRatio"
    ["quantile_counts"]="--quantile_counts"
    ["population_counts"]="--population_counts"
    ["trycount"]="--trycount"
    ["proportion"]="--proportion"
)

input_csv="test.csv"  

output_file="gametesM_dict_test2.yml"

IFS=',' read -r -a keys < "$input_csv"
IFS=',' read -r -a values < <(sed -n 2p "$input_csv")

echo "#!/bin/bash" > "$output_file"


### json-like format
for i in "${!keys[@]}"; do
    if [[ -n "${gametesm[$key]}" ]]; then
        command="${gametesm[$key]}"
	echo "\"$command\": \"${values[$i]}\"" >> "$output_file"    
fi
done


#table file format
for i in "${!keys[@]}"; do
    if [[ -n "${gametesm[$key]}" ]]; then
        command="${gametesm[$key]}"
    echo "\"$command\"\\t \"${values[$i]}\"" >> "$output_file"    
fi
done







