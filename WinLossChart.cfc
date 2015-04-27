<cfcomponent displayname="WinLossChart" hint="This is a WinLossChart object" output="false" extends="Sparkline" >
	<cffunction name="init" access="public" returntype="Sparkline" output="false" hint="This is the WinLossChart init">
		<cfargument name="height" required="true" type="Numeric">
		<cfargument name="width" required="false" type="Numeric" default="0">
		<cfargument name="tickWidth" required="false" type="Numeric" default="2">
		<cfargument name="gapWidth" required="false" type="Numeric" default="1">
		<cfargument name="winColor" required="false" type="String" default="00FF00">
		<cfargument name="lossColor" required="false" type="String" default="FF0000">
		<cfargument name="tieColor" required="false" type="String" default="0000FF">
		<cfargument name="backgroundColor" required="false" type="String" default="FFFFFF">
		<cfscript>
			variables.instance = structNew();
			setChartType('WinLoss');
			setHeight(arguments.height);
			setTickWidth(arguments.tickWidth);
			setTickHeight(arguments.height);
			setGapWidth(arguments.gapWidth);
//			setWidth(arguments.width);
			setWinColor(arguments.winColor);
			setLossColor(arguments.lossColor);
			setTieColor(arguments.tieColor);
			setBackgroundColor(arguments.backgroundColor);

		</cfscript>
		<cfreturn this />
	</cffunction>
	<cffunction name="getSpark" access="public" returntype="Any" output="true">
		<cfargument name="dataValues" required="true" type="any">
		<cfset setWidth(listLen(dataValues) * (getTickWIdth() + (getGapWidth() *2)) - (getGapWidth()))>

		<cfset myImage=ImageNew("",getWidth(),getHeight(),"rgb",getBackGroundColor())>
		<cfscript>
			For (i=1;i LTE ListLen(dataValues); i++){
				//writeoutput(listGetAt(dataValues,i));
				switch(listGetAt(dataValues,i)){
					case(1):
						ImageSetDrawingColor(myImage,getWinColor());
						ys = 0;
						th = getTickHeight();
					break;
					case(-1):
						ImageSetDrawingColor(myImage,getLossColor());
						ys = getTickHeight();
						th = getTickHeight();
					break;
					case(0):
						ImageSetDrawingColor(myImage,getTieColor());
						ys = getTickHeight();
						th = 1;
					break;
				}
				xs = (i-1)*(getTickWidth() + (getGapWidth() * 2));
				tw = getTickWidth();
				ImageDrawRect(myImage,xs,ys,tw,th,"yes");
			}
			</cfscript>
		<cfimage action="writeToBrowser" source="#myImage#">
	</cffunction>

	<cffunction name="getWinColor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.winColor />
	</cffunction>
	<cffunction name="setWinColor" access="public" returntype="VOID" output="false">
		<cfargument name="winColor" type="string" required="true" />
		<cfset variables.instance.winColor = arguments.winColor />
	</cffunction>
	<cffunction name="getLossColor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.lossColor />
	</cffunction>
	<cffunction name="setLossColor" access="public" returntype="VOID" output="false">
		<cfargument name="lossColor" type="string" required="true" />
		<cfset variables.instance.lossColor = arguments.lossColor />
	</cffunction>
	<cffunction name="getTieColor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.tieColor />
	</cffunction>
	<cffunction name="setTieColor" access="public" returntype="VOID" output="false">
		<cfargument name="tieColor" type="string" required="true" />
		<cfset variables.instance.tieColor = arguments.tieColor />
	</cffunction>

	<cffunction name="getTickWidth" access="public" returntype="Numeric" output="false">
		<cfreturn variables.instance.tickWidth />
	</cffunction>
	<cffunction name="setTickWidth" access="public" returntype="VOID" output="false">
		<cfargument name="tickWidth" type="Numeric" required="true" />
		<cfset variables.instance.tickWidth = arguments.tickWidth />
	</cffunction>

	<cffunction name="getTickHeight" access="public" returntype="Numeric" output="false">
		<cfreturn variables.instance.tickHeight />
	</cffunction>
	<cffunction name="setTickHeight" access="public" returntype="VOID" output="false">
		<cfargument name="height" type="Numeric" required="true" />
		<cfset variables.instance.tickHeight = (arguments.height / 2) />
	</cffunction>

	<cffunction name="getGapWidth" access="public" returntype="Numeric" output="false">
		<cfreturn variables.instance.gapWidth />
	</cffunction>
	<cffunction name="setGapWidth" access="public" returntype="VOID" output="false">
		<cfargument name="gapWidth" type="Numeric" required="true" />
		<cfset variables.instance.gapWidth = arguments.gapWidth />
	</cffunction>
</cfcomponent>