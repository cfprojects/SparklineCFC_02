<cfcomponent displayname="ColumnChart" hint="This is a ColumnChart object" output="false" extends="Sparkline" >
	<cffunction name="init" access="public" returntype="Sparkline" output="false" hint="This is the ColumnChart init">
		<cfargument name="width" required="true" type="Numeric">
		<cfargument name="height" required="true" type="Numeric">
		<cfscript>
			variables.instance = structNew();
			setChartType('Column');
			setWidth(arguments.width);
			setHeight(arguments.height);
		</cfscript>
		<cfreturn this />
	</cffunction>
	<cffunction name="getSpark" access="public" returntype="Any" output="true">
		<cfset myImage=ImageNew("",getWidth(),getHeight(),"rgb","DDDDDD")>
		<cfimage action="writeToBrowser" source="#myImage#">
	</cffunction>

</cfcomponent>