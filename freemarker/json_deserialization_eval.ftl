
<h1>Simple deserialization with eval</h1>
<#assign beer_json_string = "{ \"name\": \"Imperial Stout\", \"description\": \"Tasty Stout Beer\"}">
<#assign beer_map = beer_json_string?eval>
<div>${beer_map.name}</div>
<div>${beer_map.description}</div>

<h1> Simple deserialization with eval, resolving references</h1>
<#assign name="junk">
<#assign beer_json_string_with_reference = "{ \"name\": \"Imperial Stout\", \"description\": \"Tasty " + "${" + "name} Stout Beer\"}">
<#assign beer_map_with_ref = beer_json_string_with_reference?eval>
<div>${beer_map_with_ref.name}</div>
<div>${beer_map_with_ref.description}</div>

<h1>Deserialization with JSONObject</h1>
<#assign liferay_beer_map = jsonFactoryUtil.createJSONObject(beer_json_string_with_reference)>
<div>${liferay_beer_map.getString("name")}</div>
<div>${liferay_beer_map.getString("description")}</div>

<h1>Deserialization with Freemarker Hash</h1>
<#assign beer_hashmap = jsonFactoryUtil.looseDeserializeSafe(beer_json_string_with_reference) >
<div>${beer_hashmap.name}</div>
<div>${beer_hashmap.description}</div>
<div>${(beer_hashmap.notthere)!}</div>
<#if beer_hashmap.name??>
     ${beer_hashmap.name} exists!
</#if>