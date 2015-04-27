<cfcomponent displayname="PieChart" hint="This is a PieChart object" output="false" extends="Sparkline" >
	<!--- info goes here --->
	<cffunction name="init" access="public" returntype="PieChart" output="false" hint="This is the barChart init">
		<cfargument name="width" required="true" type="Numeric">
		<cfargument name="height" required="false" type="Numeric" default="0">
		<cfargument name="border" required="false" type="Numeric" default="0">
		<cfargument name="borderColor" required="false" type="String" default="000000">
		<cfargument name="backgroundColor" required="false" type="String" default="FFFFFF">
		<cfargument name="segmentColors" required="false" default="#listToArray('000000')#" type="array">
		<cfscript>
			variables.instance = structNew();
			setChartType('Pie');
			setWidth(arguments.width);
			if(arguments.height neq 0){
				setHeight(arguments.height);
			}else{
				setHeight(arguments.width);
			}
			setBorder(arguments.border);
			setBorderColor(arguments.borderColor);
			setBackgroundColor(arguments.backgroundColor);
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
				percTotal = ArraySum(listToArray(arguments.dataValues));
				arcStart = 90;
				For (i=1;i LTE ListLen(arguments.dataValues); i++){
					dataPerc = (-360 * (listGetAt(arguments.dataValues,i) / percTotal));
					ImageSetDrawingColor(myImage,variables.instance.segmentColors[i]);
					// I added a sliver to the slice to fill in the gap left between pieces dataPerc - n
					ImageDrawArc(myImage,0,0,getWidth(),getHeight(),arcStart,dataPerc-2,"yes");
					arcStart += dataPerc;
				}
			</cfscript>
			

		<cfelse>
			<cfset dataPerc = -360 * (arguments.dataValues / 100)>
			<cfset ImageSetDrawingColor(myImage,"FF0000")>
			<cfset ImageDrawArc(myImage,0,0,getWidth(),getHeight(),90,dataPerc,"yes")>
		</cfif>
		<cfif variables.instance.border gt 0>
			<cfscript>
				attr=StructNew();
				attr.width = variables.instance.border;				
				ImageSetDrawingStroke(myImage,attr);
				ImageSetDrawingColor(myImage,variables.instance.borderColor);
				ImageDrawOval(myImage,0,0,(getWidth() -1),(getHeight() -1));
			</cfscript>
		</cfif>		
		<cfimage action="writeToBrowser" source="#myImage#">
	</cffunction>

</cfcomponent>