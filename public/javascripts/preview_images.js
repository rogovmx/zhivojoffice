var offsetfrommouse=[15,15];
var displayduration=0;
var defaultimageheight = 200;
var defaultimagewidth = 200;
var timerN;

function gettrailobj() {
  if (document.getElementById)
  return document.getElementById("preview_div").style
}

function gettrailobjnostyle() {
  if (document.getElementById)
  return document.getElementById("preview_div")
}

function truebody() {
  return (!window.opera && document.compatMode && document.compatMode!="BackCompat") ? document.documentElement : document.body;
}

function hidetrail() {
  gettrailobj().display= "none";
  document.onmousemove=""
  gettrailobj().left="-500px"
  clearTimeout(timerN);
}

function showtrail(imagename,width,height) {
  i = imagename;
  w = width;
  h = height;
  timerN = setTimeout("show_preview('"+i+"',w,h);",10);
}

function show_preview(imagename,width,height) {

  var docwidth  = document.all ? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth - offsetfrommouse[0];
  var docheight = document.all ? Math.min(truebody().scrollHeight, truebody().clientHeight) : Math.min(window.innerHeight);
  

  if( (navigator.userAgent.indexOf("Firefox")!=-1 || navigator.userAgent.indexOf('MSIE')!=-1 ) && (docwidth>650 && docheight>500)) {
  //  ( width == 0 ) ? width = defaultimagewidth: '';
  //  ( height == 0 ) ? height = defaultimageheight: '';
  w = width + 20;
  h = height + 20;
    defaultimageheight = height;
    defaultimagewidth = width;
    document.onmousemove=followmouse;
    newHTML = '<DIV STYLE="width:'+ w +'px; height:'+ h +'px">';
    newHTML = newHTML + '<IMG SRC="' + imagename + '" STYLE="border: 1px solid #b1b3b6; bgcolor: #ffffff; width:' + width + 'px;" BORDER=0></IMG>';
    newHTML = newHTML + '</DIV>';
    gettrailobjnostyle().innerHTML = newHTML;
    gettrailobj().display="block";
  }
}

function followmouse(e) {
  var xcoord=offsetfrommouse[0];
  var ycoord=offsetfrommouse[1];
  var docwidth=document.all? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth-15;
  var docheight=document.all? Math.min(truebody().scrollHeight, truebody().clientHeight) : Math.min(window.innerHeight);

  if (typeof e != "undefined") {
    if (docwidth - e.pageX < defaultimagewidth + 2*offsetfrommouse[0]) {
      xcoord = e.pageX - xcoord - defaultimagewidth; // Move to the left side of the cursor
    } else {
      xcoord += e.pageX;
    }
    if (docheight - e.pageY < defaultimageheight + 2*offsetfrommouse[1]) {
      ycoord += e.pageY - Math.max(0,(2*offsetfrommouse[1] + defaultimageheight + e.pageY - docheight - truebody().scrollTop));
    } else {
      ycoord += e.pageY;
    }
  } else if (typeof window.event != "undefined") {
    if (docwidth - event.clientX < defaultimagewidth + 2*offsetfrommouse[0]) {
      xcoord = event.clientX + truebody().scrollLeft - xcoord - defaultimagewidth; // Move to the left side of the cursor
    } else {
      xcoord += truebody().scrollLeft+event.clientX
    }
    if (docheight - event.clientY < (defaultimageheight + 2*offsetfrommouse[1])) {
      ycoord += event.clientY + truebody().scrollTop - Math.max(0,(2*offsetfrommouse[1] + defaultimageheight + event.clientY - docheight));
    } else {
      ycoord += truebody().scrollTop + event.clientY;
    }
  }
  gettrailobj().left = xcoord+"px";
  gettrailobj().top  = ycoord+"px";
}
