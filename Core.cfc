<cfcomponent displayname="Core" hint="This is teh Core UDF Lib" output="false">
	<cffunction access="public" name="listSum" output="false" returntype="Numeric">
		<cfargument name="list" required="true">
		<cfscript>
			listTotal = 0;
			For (i=1;i LTE ListLen(list); i++) listTotal += ListGetAt(list, i);
		</cfscript>
		<cfreturn listTotal />
	</cffunction>
</cfcomponent>
