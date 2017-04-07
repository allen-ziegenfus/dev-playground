<p>
	Freemarker has some nice native support for working with JSON. And with the help of a few Liferay utility classes, it's very easy to even consume JSON web services from Freemarker. Note: you can view all of the example code on github:&nbsp;<a href="https://github.com/allen-ziegenfus/dev-playground/tree/master/freemarker">https://github.com/allen-ziegenfus/dev-playground/tree/master/freemarker</a></p>
<h2>
	Converting JSON to Freemarker types</h2>
<p>
	Freemarker hashes and sequences can be created from literal JSON strings as follows:&nbsp;</p>
<h3>
	Creating a normal hash</h3>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		<span style="color: rgb(0,128,0);">&lt;#-- Freemarker hash from JSON literal --&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beer_map = { "name": "Imperial Stout", "description": "Tasty Stout Beer"} </span>&gt;</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_map.name}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_map.description}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
</div>
<h3>
	&nbsp;</h3>
<p>
	Output:</p>
<div style="background-color: rgb(255,255,255);">
	Imperial Stout</div>
<div style="background-color: rgb(255,255,255);">
	Tasty Stout Beer</div>
<div style="background-color: rgb(255,255,255);">
	&nbsp;</div>
<h3>
	Creating a sequence</h3>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		<span style="color: rgb(0,128,0);">&lt;#-- Freemarker array from JSON literal --&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> food_pairing_array = ["Salmon", "Pizza with Taleggio"</span>] &gt;</div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">list</span><span style="color: rgb(0,16,128);"> food_pairing_array as food_pairing</span>&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${food_pairing}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		&lt;/#<span style="color: rgb(121,94,38);">list</span>&gt;</div>
</div>
<h3>
	&nbsp;</h3>
<p>
	Output:&nbsp;</p>
<p>
	<span style="background-color: rgb(255,255,255);">Salmon</span></p>
<p>
	<span style="background-color: rgb(255,255,255);">Pizza with Taleggio</span></p>
<h3>
	&nbsp;</h3>
<h3>
	Creating a complex hash with an embedded sequence</h3>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		<span style="color: rgb(0,128,0);">&lt;#-- Freemarker hash with array from JSON literal --&gt;</span></div>
	<div>
		&lt;#assign complex_beer_map =</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{ &nbsp;&nbsp;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name": "Imperial Stout",</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"description": "Tasty Stout Beer",</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"food_pairing": [</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Salmon",</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Pizza with Taleggio"</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;} &gt;</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${complex_beer_map.name}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${complex_beer_map.description}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">list</span><span style="color: rgb(0,16,128);"> complex_beer_map.food_pairing as food_pairing</span>&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${food_pairing}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		&lt;/#<span style="color: rgb(121,94,38);">list</span>&gt;</div>
</div>
<p>
	Output:</p>
<div style="background-color: rgb(255,255,255);">
	Imperial Stout</div>
<div style="background-color: rgb(255,255,255);">
	Tasty Stout Beer</div>
<div style="background-color: rgb(255,255,255);">
	Salmon</div>
<div style="background-color: rgb(255,255,255);">
	Pizza with Taleggio</div>
<p>
	&nbsp;</p>
<p>
	But what if we have JSON in a String object? In this case there are a couple approaches:</p>
<h3>
	Using the built-in ?eval</h3>
<p>
	Using ?eval on a String that includes JSON will convert it like a literal to a Freemarker hash. As the name implies, Freemarker also evaluates any expressions in the String, which may or may not be what you want. For example, the reference ${name} is resolved:</p>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		<span style="color: rgb(128,0,0);">&lt;h1&gt;</span>Simple deserialization with eval<span style="color: rgb(128,0,0);">&lt;/h1&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beer_json_string = "{ \"name\": \"Imperial Stout\", \"description\": \"Tasty Stout Beer\"}"</span>&gt;</div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beer_map = beer_json_string?eval</span>&gt;</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_map.name}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_map.description}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<br />
	<div>
		<span style="color: rgb(128,0,0);">&lt;h1&gt;</span> Simple deserialization with eval, resolving references<span style="color: rgb(128,0,0);">&lt;/h1&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> name="junk"</span>&gt;</div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beer_json_string_with_reference = "{ \"name\": \"Imperial Stout\", \"description\": \"Tasty " + "${" + "name} Stout Beer\"}"</span>&gt;</div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beer_map_with_ref = beer_json_string_with_reference?eval</span>&gt;</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_map_with_ref.name}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_map_with_ref.description}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
</div>
<h3>
	&nbsp;</h3>
<p>
	Output:</p>
<div style="background-color: rgb(255,255,255);">
	Imperial Stout</div>
<div style="background-color: rgb(255,255,255);">
	Tasty Stout Beer</div>
<div style="background-color: rgb(255,255,255);">
	Imperial Stout</div>
<div style="background-color: rgb(255,255,255);">
	Tasty junk Stout Beer</div>
<p>
	&nbsp;</p>
<h3>
	Create a JSONObject with the Liferay jsonFactoryUtil</h3>
<p>
	With the jsonFactoryUtil we can also pass a JSON string and get a JSONObject. This will not resolve any references, but has the downside that we can't use expression language references with the resulting object. Instead we have to use the JSONObject methods like getString:</p>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		<span style="color: rgb(128,0,0);">&lt;h1&gt;</span>Deserialization with JSONObject<span style="color: rgb(128,0,0);">&lt;/h1&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> liferay_beer_map = jsonFactoryUtil.createJSONObject(beer_json_string_with_reference)</span>&gt;</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${liferay_beer_map.getString(</span><span style="color: rgb(121,94,38);">"name")</span><span style="color: rgb(0,16,128);">}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${liferay_beer_map.getString(</span><span style="color: rgb(121,94,38);">"description")</span><span style="color: rgb(0,16,128);">}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		&nbsp;</div>
</div>
<h3>
	&nbsp;</h3>
<p>
	Output:&nbsp;</p>
<div style="background-color: rgb(255,255,255);">
	Imperial Stout</div>
<div style="background-color: rgb(255,255,255);">
	Tasty ${name} Stout Beer</div>
<div style="background-color: rgb(255,255,255);">
	&nbsp;</div>
<h3>
	Deserialization with jsonFactoryUtil</h3>
<p>
	The deserialization methods of jsonFactoryUtil will return back an object that is apparently automagically mapped to a Freemarker hash. This makes referencing even nested JSON data easy and "natural", and you can also use the standard Freemarker operators to check for values or provide default values (!):</p>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		<span style="color: rgb(128,0,0);">&lt;h1&gt;</span>Deserialization with Freemarker Hash<span style="color: rgb(128,0,0);">&lt;/h1&gt;</span></div>
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beer_hashmap = jsonFactoryUtil.looseDeserializeSafe(beer_json_string_with_reference) </span>&gt;</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_hashmap.name}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_hashmap.description}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<div>
		&nbsp;</div>
</div>
<h2>
	&nbsp;</h2>
<p>
	Output:&nbsp;</p>
<div style="background-color: rgb(255,255,255);">
	Imperial Stout</div>
<div style="background-color: rgb(255,255,255);">
	Tasty ${name} Stout Beer</div>
<div style="background-color: rgb(255,255,255);">
	&nbsp;</div>
<h2>
	Converting Freemarker Objects to JSON</h2>
<p>
	To go the other direction was can also use our friend jsonFactoryUtil. In this case I instantiate a Freemarker hash with a literal, and then output the JSON to the browser console.</p>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		&lt;#assign complex_beer_map =</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;{ &nbsp;&nbsp;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name": "Imperial Stout",</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"description": "Tasty Stout Beer",</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"food_pairing": [</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Salmon",</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Pizza with Taleggio"</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;} &gt;</div>
	<br />
	<div>
		<span style="color: rgb(128,0,0);">&lt;script&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0,0,255);">var</span> <span style="color: rgb(0,16,128);">beerMap</span> = <span style="color: rgb(0,16,128);">$</span>{jsonFactoryUtil.l<span style="color: rgb(121,94,38);">ooseSerializeDeep</span>(<span style="color: rgb(0,16,128);">complex_beer_map</span>)};</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(38,127,153);">console</span>.<span style="color: rgb(121,94,38);">log</span>(<span style="color: rgb(0,16,128);">beerMap</span>);</div>
	<div>
		<span style="color: rgb(128,0,0);">&lt;/script&gt;</span></div>
</div>
<h2>
	&nbsp;</h2>
<p>
	<img alt="" src="https://raw.githubusercontent.com/allen-ziegenfus/dev-playground/master/freemarker/browser_output.jpg" style="height: 59px; width: 500px;" /></p>
<h2>
	Bringing it all together</h2>
<p>
	Finally, these techniques can be combined with using the httpUtil to fetch JSON data to pull JSON data from external services and create markup in Freemarker. Here is an example using the "Beer" api at https://punkapi.com/</p>
<p>
	&nbsp;</p>
<div style="border: 1.0px solid black;padding: 10.0px;background-color: white;font-family: Menlo , Monaco , &quot;Courier New&quot; , monospace;font-size: 12.0px;line-height: 18.0px;">
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> response = httpUtil.URLtoString("http://api.punkapi.com/v2/beers/random")</span>&gt;</div>
	<br />
	<div>
		&lt;#<span style="color: rgb(121,94,38);">assign</span><span style="color: rgb(0,16,128);"> beers_info = jsonFactoryUtil.looseDeserializeSafe(response) </span>&gt;</div>
	<br />
	<div>
		&lt;#<span style="color: rgb(121,94,38);">list</span><span style="color: rgb(0,16,128);"> beers_info as beer_info</span>&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;h1&gt;</span><span style="color: rgb(0,16,128);">${beer_info.name}</span><span style="color: rgb(128,0,0);">&lt;/h1&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;div&gt;</span><span style="color: rgb(0,16,128);">${beer_info.description}</span><span style="color: rgb(128,0,0);">&lt;/div&gt;</span></div>
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;h2&gt;</span>Ingredients<span style="color: rgb(128,0,0);">&lt;/h2&gt;</span></div>
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&lt;#<span style="color: rgb(121,94,38);">list</span><span style="color: rgb(0,16,128);"> beer_info.ingredients?keys as ingredient_type</span>&gt;</div>
	<br />
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;h3&gt;</span><span style="color: rgb(0,16,128);">${ingredient_type}</span><span style="color: rgb(128,0,0);">&lt;/h3&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;ul&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;#<span style="color: rgb(121,94,38);">if</span><span style="color: rgb(0,16,128);"> beer_info.ingredients[ingredient_type</span>]?is_sequence&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;#<span style="color: rgb(121,94,38);">list</span><span style="color: rgb(0,16,128);"> beer_info.ingredients[ingredient_type</span>] as ingredients&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;li&gt;</span> <span style="color: rgb(0,16,128);">${ingredients.name}</span> <span style="color: rgb(128,0,0);">&lt;/li&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/#<span style="color: rgb(121,94,38);">list</span>&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;#<span style="color: rgb(121,94,38);">else</span>&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;li&gt;</span><span style="color: rgb(0,16,128);">${beer_info.ingredients</span><span style="color: rgb(121,94,38);">[ingredient_type]</span><span style="color: rgb(0,16,128);">}</span><span style="color: rgb(128,0,0);">&lt;/li&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/#<span style="color: rgb(121,94,38);">if</span>&gt;</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(128,0,0);">&lt;/ul&gt;</span></div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&lt;/#<span style="color: rgb(121,94,38);">list</span>&gt;</div>
	<div>
		&lt;/#<span style="color: rgb(121,94,38);">list</span>&gt;</div>
</div>
<div>
	&nbsp;</div>
<div>
	This produces the following output!</div>
<div>
	&nbsp;</div>
<div style="padding: 30.0px;border: 1.0px solid black;">
	<h1 style="font-size: 3.0em;">
		Dogma</h1>
	<div>
		<div style="background-color: rgb(255,255,255);">
			Brewed with over ten different types of malt, and blended together with Scottish heather honey, it is a pantheon to the gods of intricacy and nuance; a beer that celebratesa confluence of ideas. Complex, indulgent and encapsulating, Dogma gives more than a cursory nod to history, to make you ponder the very nature of beer itself.</div>
		<h2 style="font-size: 2.25em;background-color: rgb(255,255,255);">
			Ingredients</h2>
		<h3 style="font-size: 1.75em;background-color: rgb(255,255,255);">
			yeast</h3>
		<ul style="padding-left: 0.0px;background-color: rgb(255,255,255);">
			<li>
				Wyeast 2007 - Pilsen Lager™</li>
		</ul>
		<h3 style="font-size: 1.75em;background-color: rgb(255,255,255);">
			hops</h3>
		<ul style="padding-left: 0.0px;background-color: rgb(255,255,255);">
			<li>
				Saaz</li>
			<li>
				First Gold</li>
		</ul>
		<h3 style="font-size: 1.75em;background-color: rgb(255,255,255);">
			malt</h3>
	</div>
	<p>
		&nbsp;</p>
	<ul style="padding-left: 0.0px;background-color: rgb(255,255,255);">
		<li>
			Pale Ale</li>
		<li>
			Munich</li>
		<li>
			Caramalt</li>
		<li>
			Crystal</li>
		<li>
			Dark Crystal</li>
		<li>
			Wheat</li>
		<li>
			Flaked Oats</li>
		<li>
			Chocolate</li>
		<li>
			Smoked</li>
		<li>
			Amber</li>
		<li>
			Brown</li>
	</ul>
</div>
