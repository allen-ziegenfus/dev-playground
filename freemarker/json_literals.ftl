
<#-- Freemarker hash from JSON literal  -->
<#assign beer_map = { "name": "Imperial Stout", "description": "Tasty Stout Beer"} >
<div>${beer_map.name}</div>
<div>${beer_map.description}</div>

<#-- Freemarker array from JSON literal  -->
<#assign food_pairing_array = ["Salmon", "Pizza with Taleggio"] >
<#list food_pairing_array as food_pairing>
	<div>${food_pairing}</div>
</#list>

<#-- Freemarker hash with array from JSON literal  -->
<#assign complex_beer_map = 
	{ 	
		"name": "Imperial Stout", 
		"description": "Tasty Stout Beer",
		"food_pairing": [
			"Salmon", 
			"Pizza with Taleggio"
		]
	} >

<div>${complex_beer_map.name}</div>
<div>${complex_beer_map.description}</div>
<#list complex_beer_map.food_pairing as food_pairing>
	<div>${food_pairing}</div>
</#list>