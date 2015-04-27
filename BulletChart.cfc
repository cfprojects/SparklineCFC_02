<cfcomponent displayname="BulletChart" hint="This is a BulletChart object" output="false" extends="Sparkline" >
	<cffunction name="init" access="public" returntype="Sparkline" output="false" hint="This is the BulletChart init">
		<cfset setChartType('Bullet')/>
		<cfreturn this />
	</cffunction>
	<cffunction name="getSpark" access="public" returntype="Any" output="true">
		<cfset myImage=ImageNew("",50,50,"rgb","DDDDDD")>
		<cfimage action="writeToBrowser" source="#myImage#">
	</cffunction>

</cfcomponent>