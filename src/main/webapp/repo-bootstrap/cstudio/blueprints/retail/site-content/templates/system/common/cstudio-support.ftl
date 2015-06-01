
<#macro toolSupport>
  <#if siteContext.overlayCallback??>
   <script src="/studio/static-assets/libs/requirejs/require.js"
           data-main="/studio/overlayhook?site=NOTUSED&page=NOTUSED&cs.js"></script>
   </#if>
</#macro>

<#macro cstudioOverlaySupport>
  <@toolSupport />
</#macro>

<#macro componentAttr path="" ice=false>
  <#if siteContext.overlayCallback??>data-studio-component-path="${path}" data-studio-component="${path}" 
    <#if ice==true>
      <@iceAttr path=path/>
    </#if>
  </#if> 
</#macro>

<#macro componentContainerAttr target>
   <#if siteContext.overlayCallback??> data-studio-components-target="${target}" </#if>
</#macro>

<#macro iceAttr iceGroup="" path="">
   <#if siteContext.overlayCallback??> data-studio-ice="${iceGroup}" <#if path!="">data-studio-ice-path="${path}"</#if> </#if>
</#macro>

<#macro ice id="" component="" componentPath="">
    <#if siteContext.overlayCallback??>
        <div data-studio-ice="${id}" ></div>
    </#if>
</#macro>


<#macro draggableComponent id="" component="" componentPath="">
    <#if siteContext.overlayCallback??>
        <#if id != "" && component == "" && componentPath == "">
            <@ice id=id>
	            <div id='${id}' class='cstudio-draggable-component'><#nested></div>
	        </@ice>
        <#elseif id == "" && componentPath == "">
            <@ice component=component>
            	<div id="cstudio-component-${component.key}" class='cstudio-draggable-component'><#nested></div>
            </@ice>
        <#elseif id == "" && component == "">
            <@ice componentPath=componentPath>
            	<div id="cstudio-component-${componentPath}" class='cstudio-draggable-component'><#nested></div>
            </@ice>
        </#if>
    <#else>
        <#nested>
    </#if>
</#macro>


<#macro componentZone id="">
	<div class="cstudio-component-zone" id="zone-${id}">
		<@ice id=id>
			<#nested>
		</@ice>
	</div>
</#macro>