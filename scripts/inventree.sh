#!/bin/bash

# Configura tu URL, token y headers
base_url='http://192.168.0.50'
token='inv-11ad986ae7498821c62ec34129a2e3f6bb62b7cc-20250410'
headers="Authorization: Token $token"

function updateAtribute {
	filter=$(echo "$1" | sed 's/ /%20/g')
	key=$2
	value=$3

	idCategory=$(curl -s -H "$headers" "$base_url/api/part/category/?name=$filter" | jq -c '.[]' | jq -r .pk)

	if [ -n "$idCategory" ]; then
		parts=$(curl -s -H "$headers" "$base_url/api/part/?category=$idCategory")

		if [ -n "$key" ]; then
			# Iterar y actualizar cada parte a salable=True
			echo "$parts" | jq -c '.[]' | while read -r part; do
				part_id=$(echo "$part" | jq -r '.pk')
				curl -s -X PATCH -H "$headers" -H "Content-Type: application/json" -d "{\"$key\": $value}" "$base_url/api/part/$part_id/"
			done
		fi
	else
		echo "idCategory no existe"
	fi
}

function deletePartsByCategory {
	filter=$(echo "$1" | sed 's/ /%20/g')
	idCategory=$(curl -s -H "$headers" "$base_url/api/part/category/?name=$filter" | jq -c '.[]' | jq -r .pk)

	if [ -n "$idCategory" ]; then
		parts=$(curl -s -H "$headers" "$base_url/api/part/?category=$idCategory")

		echo "$parts" | jq -c '.[]' | while read -r part; do
			part_id=$(echo "$part" | jq -r .pk)
			curl -X DELETE -H "$headers" "$base_url/api/part/$part_id/"
		done
	else
		echo "idCategory no existe"
	fi
}

function changeInternalPriceByCategory {
	filter=$(echo "$1" | sed 's/ /%20/g')
	price=$2
	idCategory=$(curl -s -H "$headers" "$base_url/api/part/category/?name=$filter" | jq -c '.[]' | jq -r .pk)

	if [ -n "$idCategory" ]; then
		parts=$(curl -s -H "$headers" "$base_url/api/part/?category=$idCategory")
		echo "$parts" | jq -c '.[]' | while read -r part; do
			idPart=$(echo "$part" | jq -r .pk)
			idInternalPrice=$(curl -s -H "$headers" "$base_url/api/part/internal-price/?part=$idPart" | jq -c ".[] | select(.part == $idPart and .quantity == 1.00)" | jq -r .pk)
			curl -s -X PATCH -H "$headers" -H "Content-Type: application/json" -d "{\"price\": $price}" "$base_url/api/part/internal-price/$idInternalPrice/"
		done
	else
		echo "idCategory no existe"
	fi
}

function createInternalPriceAll {
	parts=$(curl -s -H "$headers" "$base_url/api/part/")
	echo "$parts" | jq -c '.[]' | while read -r part; do
		idPart=$(echo "$part" | jq -r .pk)
		curl -X POST -H "$headers" -H "Content-Type: application/json" -d "{\"part\": $idPart, \"quantity\": 1.0, \"price\": 100, \"price_currency\": \"ARS\"}" "$base_url/api/part/internal-price/"
	done
}

# changeInternalPriceByCategory "$1" "$2"
createInternalPriceAll
