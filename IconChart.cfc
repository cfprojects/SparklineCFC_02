<cfcomponent displayname="IconChart" hint="This is a IconChart object" output="false" extends="Sparkline" >
	<cffunction name="init" access="public" returntype="Sparkline" output="false" hint="This is the IconChart init">
		<cfset setChartType('Icon')/>
		<cfreturn this />
	</cffunction>
	<cffunction name="getSpark" access="public" returntype="Any" output="true">
		<cfset myImage=ImageNew("",50,50,"rgb","DDDDDD")>
		<cfimage action="writeToBrowser" source="#myImage#">
	</cffunction>

</cfcomponent>