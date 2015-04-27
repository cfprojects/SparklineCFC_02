<cfscript>
sPieSettings = structNew();
sPieSettings.type = "pie";
sPieSettings.width = 20;
sPieSettings.borderWidth = 0.5;
sPieSettings.borderColor = "48783a";
sPieSettings.foregroundColors = "b9cde1...045a8d";
PieChart = createobject("component","Sparkline").init(argumentCollection = sPieSettings);

sLeftHorizonialBar = structNew();
sLeftHorizonialBar.type = "stackedbar";
sLeftHorizonialBar.width = 200;
sLeftHorizonialBar.foregroundColors = "b9cde1...034694";
sLeftHorizonialBar.direction = "ltr";
HorizonialBar = createobject("component","Sparkline").init(argumentCollection = sLeftHorizonialBar);

sRightHorizonialBar = structNew();
sRightHorizonialBar.type = "stackedbar";
sRightHorizonialBar.width = 200;
sRightHorizonialBar.foregroundColors = "ff9595...a40000";
sRightHorizonialBar.position = "right";
RightHorizonialBar = createobject("component","Sparkline").init(argumentCollection = sRightHorizonialBar);

sFullHorizonialBar = structNew();
sFullHorizonialBar.type = "fullstackedbar";
sFullHorizonialBar.width = 200;
sFullHorizonialBar.foregroundColors = "b9cde1...034694";
sFullHorizonialBar.backgroundColor = "cccccc";
FullHorizonialBar = createobject("component","Sparkline").init(argumentCollection = sFullHorizonialBar);

sBulletGraph = structNew();
sBulletGraph.type = "BulletGraph";
sBulletGraph.width = 200;
sBulletGraph.qualitativeRanges = "80,120,200";
sBulletGraph.qualitativeColors = "996633,CC9966,FFCC99";
sBulletGraph.foregroundColors = "000000,808080";
sBulletGraph.backgroundColor = "00FF00";
BulletGraph = createobject("component","Sparkline").init(argumentCollection = sBulletGraph);

sColumn = structNew();
sColumn.type = "column";
sColumn.foregroundColors = "000030";
sColumn.backgroundColor = "ffffff";
Column = createobject("component","Sparkline").init(argumentCollection = sColumn);

sWinLossChart = structNew();
sWinLossChart.type = "winloss";
sWinLossChart.backgroundColor = "ffffff";
WinLoss = createobject("component","Sparkline").init(argumentCollection = sWinLossChart);

</cfscript>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Sparkline Demo</title>
</head>
<body>
<cfoutput>

<h2>Bullet Graph</h2>
<table>
<tr>
	<td>performance</td>
	<td>&nbsp;</td>
</tr>
<cfloop from="1" to="5" index="xxx">
	<cfset d1 = randRange(50,150)>
	<cfset data = "#d1#">
	<cfset referencePoints = "100">
	<cfset dot = true>
	<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot}>
	<tr>
		<td align="right">#d1#%</td>
		<cfset dot = false>
		<cfset qColors = "DD747A,EAABAF,AFD7B9,7ABC8A">
		<cfset qRanges = "70,100,130,200">
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors, qualitativeRanges = qRanges}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
		<cfset dot = true>
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors, qualitativeRanges = qRanges}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
		<cfset dot = false>
		<cfset qColors = "aaaaaa,cccccc,eeeeee">
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
		<cfset dot = true>
		<cfset qColors = "aaaaaa,cccccc,eeeeee">
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
	</tr>
</cfloop>

<cfloop from="1" to="5" index="xxx">
	<cfset d1 = randRange(50,150)>
	<cfset d2 = d1 + randRange(25,50)>
	<cfset data = "#d1#,#d2#">
	<cfset referencePoints = "100">
	<cfset dot = true>
	<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot}>
	<tr>
		<td align="right">#d1#% : #d2#%</td>
		<cfset dot = false>
		<cfset qColors = "DD747A,EAABAF,AFD7B9,7ABC8A">
		<cfset qRanges = "70,100,130,200">
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors, qualitativeRanges = qRanges}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
		<cfset dot = true>
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors, qualitativeRanges = qRanges}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
		<cfset dot = false>
		<cfset qColors = "aaaaaa,cccccc,eeeeee">
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
		<cfset dot = true>
		<cfset qColors = "aaaaaa,cccccc,eeeeee">
		<cfset args = {data=data, referencePoints=referencePoints, performanceDot=dot, qualitativeColors = qColors}>
		<td>#BulletGraph.draw(argumentcollection=args)#</td>
	</tr>
</cfloop>
</table>


<h2>Stacked Bar</h2>
<h3>Left justified</h3>
<table>
<tr>
	<td>With data labels</td>
	<td>Without data labels</td>
	<td>Pie</td>
</tr>
<cfloop from="1" to="3" index="xxx">
	<cfset d1 = randRange(5,50)>
	<cfset d2 = randRange(5,50)>
	<cfset d3 = randRange(5,50)>
	<cfset d4 = randRange(5,50)>
	<cfset data = "#d1#,#d2#,#d3#,#d4#">
	<cfset args = {data=data, showDataLabels=true}>
	<tr>
		<td>#HorizonialBar.draw(argumentcollection=args)#</td>
		<td>#HorizonialBar.draw(data)#</td>
		<td>#PieChart.draw(data)#</td>
	</tr>
</cfloop>
</table>

<h3>Right justified</h3>
<table>
<tr>
	<td>With data labels</td>
	<td>Without data labels</td>
	<td>Pie</td>
</tr>
<cfloop from="1" to="3" index="xxx">
	<cfset d1 = randRange(5,50)>
	<cfset d2 = randRange(5,50)>
	<cfset d3 = randRange(5,50)>
	<cfset d4 = randRange(5,50)>
	<cfset data = "#d1#,#d2#,#d3#,#d4#">
	<cfset args = {data=data, showDataLabels=true}>	
	<tr>
		<td>#RightHorizonialBar.draw(argumentcollection=args)#</td>
		<td>#RightHorizonialBar.draw(data)#</td>
		<td>#PieChart.draw(data)#</td>
	</tr>
</cfloop>
</table>

<h3>100%</h3>
<cfloop from="1" to="3" index="xxx">
	<cfset d1 = randRange(5,50)>
	<cfset d2 = randRange(5,50)>
	<cfset d3 = randRange(5,50)>
	<cfset d4 = randRange(5,50)>
	<cfset data = "#d1#,#d2#,#d3#,#d4#">
	#FullHorizonialBar.draw(data)# #PieChart.draw(data)#<br>
</cfloop>

<h2>Column Charts</h2>
<h3>Default</h3>
<cfloop from="1" to="3" index="xxx">
<cfscript>
	myRandList = "";
	For (xrn=1;xrn LTE 160; xrn++){
		myRandList = listAppend(myRandList, randRange(10, 20));
	}
</cfscript>
#Column.draw(myRandList)#<br />
</cfloop>

<h3>High/low values are highlighted</h3>
<cfloop from="1" to="3" index="xxx">
<cfscript>
	myRandList = "";
	For (xrn=1;xrn LTE 160; xrn++){
		myRandList = listAppend(myRandList, randRange(10, 20));
	}
	args = {data=myRandList,showHighLow=true};
</cfscript>

#Column.draw(argumentcollection=args)#<br />
</cfloop>

<h2>Win lose</h2>
<cfloop from="1" to="3" index="xxx">
<cfscript>
	myRandList = "";
	For (xrn=1;xrn LTE 160; xrn++){
		myRandList = listAppend(myRandList, iif(randRange(0, 1), 1, -1));
	}
</cfscript>
#WinLoss.draw(myRandList)#<br />
</cfloop>
</cfoutput>
</body>
</html>
