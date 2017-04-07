<#assign response = httpUtil.URLtoString("http://api.punkapi.com/v2/beers/random")>

<#assign beers_info = jsonFactoryUtil.looseDeserializeSafe(response) >

<#list beers_info as beer_info>
	<h1>${beer_info.name}</h1>
	<div>${beer_info.description}</div>

	<h2>Ingredients</h2>

	<#list beer_info.ingredients?keys as ingredient_type>

		<h3>${ingredient_type}</h3>
		<ul>
		<#if beer_info.ingredients[ingredient_type]?is_sequence>
		
			<#list beer_info.ingredients[ingredient_type] as ingredients>
				<li> ${ingredients.name} </li>
			</#list>
			
		<#else>
			<li>${beer_info.ingredients[ingredient_type]}</li>
		</#if>
		</ul>
	</#list>
</#list>
