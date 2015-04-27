<cfcomponent displayname="BarChart" hint="This is a BarChart object" output="false" extends="Sparkline" >
	<cffunction name="init" access="public" returntype="Sparkline" output="false" hint="This is the BarChart init">
		<cfargument name="width" required="true" type="Numeric">
		<cfargument name="height" required="true" type="Numeric">
		<cfargument name="fullStackedBar" required="false" type="Boolean" default="1">
		<cfargument name="maxStackedBar" required="false" type="numeric" default="0">
		<cfargument name="backgroundColor" required="false" type="String" default="FFFFFF">
		<cfargument name="barAlign" required="false" type="String" default="left">
		<cfargument name="segmentColors" required="false" default="#listToArray('000000')#" type="array">
		<cfscript>
			variables.instance = structNew();
			setChartType('Bar');
			setWidth(arguments.width);
			setHeight(arguments.height);
			setFullStackedBar(arguments.fullStackedBar);
			setMaxStackedBar(arguments.maxStackedBar);
			setBackgroundColor(arguments.backgroundColor);
			setBarAlign(arguments.barAlign);
			setSegementColors(arguments.segmentColors);
		</cfscript>
		<cfreturn this />
	</cffunction>
	<cffunction name="getSpark" access="public" returntype="Any" output="true">
		<cfargument name="dataValues" required="true" type="any">
		<cfset myImage=ImageNew("",getWidth(),getHeight(),"rgb",getBackgroundColor())>
		<cfset ImageSetantiAliasing(myImage,"on")>
		<cfif listLen(arguments.dataValues) gt 1>
			<cfscript>
				if(getFullStackedBar()){
					percTotal = ArraySum(listToArray(arguments.dataValues));
				}else{
					percTotal = getMaxStackedBar();
				}
				if(getBarAlign() eq "right"){
					barStart = getWidth();
					// This is for reversed Color Data Order
					For (i=1;i LTE ListLen(arguments.dataValues); i++){
					// This is for normal color/data order
					//For (i=ListLen(arguments.dataValues);i GTE 1; i--){
						dataPerc = (getWidth() * (listGetAt(arguments.dataValues,i) / percTotal));
						ImageSetDrawingColor(myImage,variables.instance.segmentColors[i]);
						ImageDrawRect(myImage,barStart-dataPerc,0,dataPerc,getWidth(),"yes");
						//ImageDrawRect(myImage,(barStart * getWidth()),0,(getWidth() * dataPerc),getHeight(),"yes");
						barStart -= dataPerc;
					}
				}else{
					barStart = 0;
					For (i=1;i LTE ListLen(arguments.dataValues); i++){
						dataPerc = (listGetAt(arguments.dataValues,i) / percTotal);
						ImageSetDrawingColor(myImage,variables.instance.segmentColors[i]);
						ImageDrawRect(myImage,(barStart * getWidth()),0,(getWidth() * dataPerc),getHeight(),"yes");
						barStart += dataPerc;
					}
				}
			</cfscript>
		</cfif>



		<cfimage action="writeToBrowser" source="#myImage#">
	</cffunction>

	<cffunction name="getFullStackedBar" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.fullStackedBar />
	</cffunction>
	<cffunction name="setFullStackedBar" access="public" returntype="VOID" output="false">
		<cfargument name="fullStackedBar" type="boolean" required="true" />
		<cfset variables.instance.fullStackedBar= arguments.fullStackedBar />
	</cffunction>

	<cffunction name="getMaxStackedBar" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.maxStackedBar />
	</cffunction>
	<cffunction name="setMaxStackedBar" access="public" returntype="VOID" output="false">
		<cfargument name="maxStackedBar" type="numeric" required="true" />
		<cfset variables.instance.maxStackedBar= arguments.maxStackedBar />
	</cffunction>

	<cffunction name="getBarAlign" access="public" returntype="string" output="false">
		<cfreturn variables.instance.barAlign />
	</cffunction>
	<cffunction name="setBarAlign" access="public" returntype="VOID" output="false">
		<cfargument name="barAlign" type="string" required="true" />
		<cfset variables.instance.barAlign= arguments.barAlign />
	</cffunction>
</cfcomponent>