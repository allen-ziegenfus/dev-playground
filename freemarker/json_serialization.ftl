<#assign complex_beer_map = 
	{ 	
		"name": "Imperial Stout", 
		"description": "Tasty Stout Beer",
		"food_pairing": [
			"Salmon", 
			"Pizza with Taleggio"
		]
	} >

<script>
	var jsonResponse = ${response};
	var beerMap = ${jsonFactoryUtil.looseSerializeDeep(complex_beer_map)};
	console.log(beerMap);
</script>