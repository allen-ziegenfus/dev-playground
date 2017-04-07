<#assign response = httpUtil.URLtoString("http://api.punkapi.com/v2/beers/random")>

<#assign beers_info = jsonFactoryUtil.looseDeserializeSafe(response) >

<#list beers_info as beer_info>
	<img src="${beer_info.image_url}"></img>
	<h1>${beer_info.name}</h1>
	<div>${beer_info.description}</div>

	<h2>Ingredients</h2>

	<#list beer_info.ingredients?keys as ingredient_type>

		<h3>${ingredient_type}</h3>
		<#if beer_info.ingredients[ingredient_type]?is_sequence>
			<#list beer_info.ingredients[ingredient_type] as ingredients>
				<div> ${ingredients.name} </div>
			</#list>
		<#else>
			${beer_info.ingredients[ingredient_type]}
		</#if>
	</#list>
</#list>
