<#function supportsWebP>
  <#return request.attributes.ACCEPT?contains("image/webp")>
</#function>

<#if supportsWebP()>
	<div> Supports WebP!</div>
<#else>
	<div> falling back to jpeg</div>
</#if>

<#macro get_folder_files group folder>
	
	<#assign images = {} >
	<#assign image_src = "">

	<#assign dl_fileentry_local_service_util = objectUtil("com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil") />
	<#assign dl_fileentry_list = dl_fileentry_local_service_util.getFileEntries(getterUtil.getLong(group), getterUtil.getLong(folder))>
	<#list dl_fileentry_list as dl_fileentry>
		<div>name: ${dl_fileentry.title}</div>
		<#assign images = images + { "${dl_fileentry.extension}": "${dl_fileentry.title}" }>
	</#list>

	<#if supportsWebP() && images.webp??>
		<div> serviing ${images.webp} </div>
		<img src="/documents/${group}/${folder}/${images.webp}"</img>
	<#else>
		<div> serviing ${images.jpg} </div>
		<img src="/documents/${group}/${folder}/${images.jpg}"</img>
	</#if>
</#macro>

<@get_folder_files 10182 226551314/>