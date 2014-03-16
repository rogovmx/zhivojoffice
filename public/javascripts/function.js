

// uniTip - written by Nathan Ford for Unit Interactive
//
// uniTip is based on qTip:
// qTip - CSS Tool Tips - by Craig Erskine
// http://qrayg.com

var uniTipTag = "a,img"; //Which tag do you want to uniTip-ize? Keep it lowercase. No spaces around commas.//
var uniTipClass = "tip"; //Which classes do you want to uniTip-ize? If you leave this blank, then all the tags designated above will get uniTip-ized. Match case. No spaces around commas.

var uniTipX = 60; // X offset from cursor//
var uniTipX2 = 430; // X offset from cursor//
var uniTipY = 230; // Y offset from cursor//

//______________________________________________There's no need to edit anything below this line//

var offsetX = uniTipX, offsetX2 = uniTipX2, offsetY = uniTipY, elewidth = null, eleheight = null, tipid = null, tiptop = null, tipbot = null, tipcapin=null, tippointin=null, altText=false;

var x=0, y=0, WinWidth=0, WinHeight=0, TipWidth=0, TipHeight=0, CapHeight=0, PointHeight=0;

// first, find all the correct elements
init = function () {
	var elementList = uniTipTag.split(",");
	for(var j = 0; j < elementList.length; j++) {	
		var elements = document.getElementsByTagName(elementList[j]);
		
		if(elements) {
			for (var i = 0; i < elements.length; i ++) {
				if (uniTipClass != '') {
				
					var elClass = elements[i].className;
					var elClassList = uniTipClass.split(",");
					
					for (var h=0; h < elClassList.length; h++) { if (elClass.match(elClassList[h])) unitipize(elements[i]); }
					
				} else unitipize(elements[i]);
			}
		}
	}
}

// next, add the tooltip function to those elements
unitipize = function (element) {
	var a = element;
	altText = (a.alt && a.getAttribute("alt") != '' ) ? true : false;
	var sTitle = (altText == true) ? a.getAttribute("alt") : a.getAttribute("title");				
	if(sTitle) {
		a.onmouseover = function() {build(a, sTitle);};
		a.onmouseout = function() {hide(a, sTitle);};
	}
}

// now, we build the tooltip
build = function (a) {
	tipid = a;
	var ii = document.getElementById(tipid);
	
	document.onmousemove = function (evt) {move (evt)};
        ii.style.display = 'block';
}

build_2 = function (a) {
	tipid = a;
	var ii = document.getElementById(tipid);

	document.onmousemove = function (evt) {move2 (evt)};
        ii.style.display = 'block';
}

// now, we track the mouse and make the tooltip follow
move = function (evt) {
	var ii = document.getElementById(tipid);
	
	if (window.event) {
		x = window.event.clientX;
		y = window.event.clientY;
		
	//	if (document.documentElement.scrollLeft) ii.style.left = (TipWidth >= WinWidth ) ? ((x - offsetX - elewidth) + document.documentElement.scrollLeft) + "px" :  (x + offsetX + document.documentElement.scrollLeft) + "px";
	//	else ii.style.left = (TipWidth >= WinWidth ) ? ((x - offsetX - elewidth) + document.body.scrollLeft) + "px" :  (x + offsetX + document.body.scrollLeft) + "px";
		if (document.documentElement.scrollLeft) ii.style.left = (TipWidth >= WinWidth ) ? ((offsetX + elewidth)) + "px" :  (offsetX - elewidth ) + "px";
		else ii.style.left = (TipWidth >= WinWidth ) ? ((offsetX + elewidth ) ) + "px" :  (offsetX - elewidth) + "px";



		if (document.documentElement.scrollTop) ii.style.top = (TipHeight >= WinHeight) ? ((y - offsetY - eleheight) + document.documentElement.scrollTop) + "px" : (y + offsetY + document.documentElement.scrollTop) + "px";
		else ii.style.top = (TipHeight >= WinHeight) ? ((y - offsetY - eleheight) + document.body.scrollTop) + "px" : (y + offsetY + document.body.scrollTop) + "px";
		
	} else {
		x = evt.clientX;
		y = evt.clientY;	
		
//		ii.style.left = (TipWidth >= WinWidth ) ? ((x - offsetX - elewidth) + window.scrollX) + "px" :  (x + offsetX + window.scrollX) + "px";
                ii.style.left = (TipWidth >= WinWidth ) ? ((offsetX + elewidth)) + "px" :  (offsetX - elewidth) + "px";

		ii.style.top = (TipHeight >= WinHeight) ? ((y - offsetY - eleheight) + window.scrollY) + "px" : (y + offsetY + window.scrollY) + "px";
	}
	
	TipWidth = x + elewidth + 20;
	TipHeight = y + eleheight + 20;
	
}

move2 = function (evt) {
	var ii = document.getElementById(tipid);

	if (window.event) {
		x = window.event.clientX;
		y = window.event.clientY;

	//	if (document.documentElement.scrollLeft) ii.style.left = (TipWidth >= WinWidth ) ? ((x - offsetX - elewidth) + document.documentElement.scrollLeft) + "px" :  (x + offsetX + document.documentElement.scrollLeft) + "px";
	//	else ii.style.left = (TipWidth >= WinWidth ) ? ((x - offsetX - elewidth) + document.body.scrollLeft) + "px" :  (x + offsetX + document.body.scrollLeft) + "px";
		if (document.documentElement.scrollLeft) ii.style.left = (TipWidth >= WinWidth ) ? ((offsetX2 + elewidth)) + "px" :  (offsetX2 - elewidth ) + "px";
		else ii.style.left = (TipWidth >= WinWidth ) ? ((offsetX2 + elewidth ) ) + "px" :  (offsetX2 - elewidth) + "px";



		if (document.documentElement.scrollTop) ii.style.top = (TipHeight >= WinHeight) ? ((y - offsetY - eleheight) + document.documentElement.scrollTop) + "px" : (y + offsetY + document.documentElement.scrollTop) + "px";
		else ii.style.top = (TipHeight >= WinHeight) ? ((y - offsetY - eleheight) + document.body.scrollTop) + "px" : (y + offsetY + document.body.scrollTop) + "px";

	} else {
		x = evt.clientX;
		y = evt.clientY;

//		ii.style.left = (TipWidth >= WinWidth ) ? ((x - offsetX - elewidth) + window.scrollX) + "px" :  (x + offsetX + window.scrollX) + "px";
                ii.style.left = (TipWidth >= WinWidth ) ? ((offsetX2 + elewidth)) + "px" :  (offsetX2 - elewidth) + "px";

		ii.style.top = (TipHeight >= WinHeight) ? ((y - offsetY - eleheight) + window.scrollY) + "px" : (y + offsetY + window.scrollY) + "px";
	}

	TipWidth = x + elewidth + 20;
	TipHeight = y + eleheight + 20;

}



// lastly, hide the tooltip
hide = function (a) {
        if (a == tipid)
          {
  	    var ii = document.getElementById(tipid);
	    ii.style.display = "none";
	  }
}

// add the event to the page
if (window.addEventListener) window.addEventListener("load", init, false);
if (window.attachEvent) window.attachEvent("onload", init);





function n_GetX(pid)
{
var X = 0;
do { X += pid.offsetLeft } while ((pid = pid.offsetParent) != null);
return X;
}

function n_GetY(pid)//C�������� �������, ���������� ������� TOP ������������� �������� 

{
var Y = 0;
do { Y += pid.offsetTop } while ((pid = pid.offsetParent) != null);
return Y;
}

function build2(a)
  {
    var ii = document.getElementById(a);
    if (ii.style.display != 'block')
      {
        ii.style.display = 'block';
        ii.style.left = n_GetX(ii) - 100;
        ii.style.top = n_GetY(ii) - 170;
      }
  }
function hide2(a)
  {
    var ii = document.getElementById(a);
    if (ii.style.display != 'none')
      {
        ii.style.left = parseInt(n_GetX(ii)) + 100;
        ii.style.top = parseInt(n_GetY(ii)) + 170;
        ii.style.display = 'none';
      }
  }
