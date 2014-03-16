
function vvkCartLoad(token) {
    var bar11 = $('bar11');
    var top_cart = $('top_cart');
    if (bar11){
    new Ajax.Updater('bar11','/kt3/oc1',{asynchronous:true,evalScripts:true, parameters:'authenticity_token=' + encodeURIComponent(token)});
    }
    if (top_cart) {
    new Ajax.Updater('top_cart','/kt3/top_cart',{asynchronous:true,evalScripts:true, parameters:'authenticity_token=' + encodeURIComponent(token)});
}
}

//cartUpdater = function(){
//    new Ajax.Updater('bar11','/kt3/oc1',{asynchronous:true,evalScripts:true, parameters:'authenticity_token=' + encodeURIComponent('<%= form_authenticity_token -%>')});
//    alert('ok');
//}
//Event.observe(window,"load",cartUpdater);


// --------------------------------------
function anchorScroller(el, duration) {


if (this.criticalSection) {
return false;
}

if ((typeof el != 'object') || (typeof el.href != 'string'))
return true;

var address = el.href.split('#');
if (address.length < 2)
return true;

address = address[address.length-1];
el = 0;

for (var i=0; i<document.anchors.length; i++) {
if (document.anchors[i].name == address) {
el = document.anchors[i];
break;
}
}
if (el === 0)
return true;

this.stopX = 0;
this.stopY = 0;
do {
this.stopX += el.offsetLeft;
this.stopY += el.offsetTop;
} while (el = el.offsetParent);

this.startX = document.documentElement.scrollLeft || window.pageXOffset || document.body.scrollLeft;
this.startY = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;

this. stopX = this.stopX - this.startX;
this.stopY = this.stopY - this.startY;

if ( (this.stopX == 0) && (this.stopY == 0) )
return false;

this.criticalSection = true;
if (typeof duration == 'undefined')
this.duration = 500;
else
this.duration = duration;

var date = new Date();
this.start = date.getTime();
this.timer = setInterval(function () {
var date = new Date();
var X = (date.getTime() - this.start) / this.duration;
if (X > 1)
X = 1;
var Y = ((-Math.cos(X*Math.PI)/2) + 0.5);

cX = Math.round(this.startX + this.stopX*Y);
cY = Math.round(this.startY + this.stopY*Y);

document.documentElement.scrollLeft = cX;
document.documentElement.scrollTop = cY;
document.body.scrollLeft = cX;
document.body.scrollTop = cY;

if (X == 1) {
clearInterval( this.timer);
this.criticalSection = false;
}
}, 10);
return false;
}


function getEl(searchClass)
{
  
 
    var els = document.getElementsByTagName('div');
    var elsLen = els.length;
    var pattern = new RegExp("(^|\\s)" + searchClass + "(\\s|$)");
 
    for (i = 0;  i < elsLen;  i++)
    {
        if (pattern.test(els[i].className))
        {
          Element.setStyle(els[i], 'display: none;')

        }
    }
 
}




function arrows_acts(id,val,num)
{

var ss555=$(id);
if(val=='+' && ss555.value < num){
ss555.value++;}


if(val=='-' && ss555.value > 1 ){
ss555.value--;
}


}


function limit(id, num) {
var val=$(id);

if (val.value > num && num > 0)
{ val.value = num;}
}



function wolf(id){
 var inp = $(id)

if (isNaN(inp.value))
{ inp.value = inp.value.slice(0, -1)
 }
if (inp.value == '' || inp.value == 0 ) {inp.value = 1}

}



function wolf_zb(id){
 var inp = $(id)

if (isNaN(inp.value))
{ inp.value = inp.value.slice(0, -1)
 }
if (inp.value == '' || inp.value <= 0 ) {inp.value = 1}
if (inp.value > 4 ) {inp.value = 4}
}



function wolf_izum(id, price, back_price){
 var inp = $(id)

if (isNaN(inp.value))
{ inp.value = inp.value.slice(0, -1)
 }
if (inp.value == '' )
{inp.value = 1}


if (inp.value > 25 && inp.value <= 300) {$(price).innerHTML = '113.00р.';}
if (inp.value <= 25 || inp.value > 300) {$(price).innerHTML = back_price +'р.';}
}


function wolf_lim(id){
 var inp = $(id)

if (isNaN(inp.value))
{ inp.value = inp.value.slice(0, -1)
 }

}




function arrows(id,val)
{

var ss555=$(id);
if(val=='+'){
ss555.value++;}


if(val=='-' && ss555.value > 1 ){
ss555.value--;
}


}



function arrows_zb(id,val)
{

var ss555=$(id);
if(val=='+' && ss555.value < 4){
ss555.value++;}


if(val=='-' && ss555.value > 1 ){
ss555.value--;
}
}

function arrows_izum(id,val,price, back_price)
{

var num = $(id);

if(val=='+' && num.value < 300){
num.value++;
}
if(val=='+' && num.value > 25 && num.value <= 300){
$(price).innerHTML = '113.00р.';
}


if(val=='-' && num.value > 1 ){
num.value--;
}

if((val=='-' && num.value < 26) || (val=='+' && num.value > 300)){
$('price34793').innerHTML = back_price + 'р.';
}

}

 function delspace(name) {
        var login = document.getElementById(name)
        login.value = login.value.replace(/\s+$/g, '')
    }




function gopage(url)
{window.location.href=url}

function open_win(fn,w,h)
{

window.open(fn, "blank1","height="+h+",width="+w+",top=0, left=260, status=0,toolbar=0,menubar=1,location=0, directories=0, resizable=0");
}


//function calc1(field,bottle,price,pp1,pp2,pp3,pp4,pp5,q) {
//        var ss555=$(field);
//       var p1=pp1;
//       var p2=pp2;
//       var p3=pp3;
//       var p4=pp4;
//       var p5=pp5;
//       var bb;
//       var pr;
//         if (q=='up') { ss555.value++; }
//         if (q=='down') { if (ss555.value > 3) { ss555.value--;} }
//
//if (ss555.value < 6) {pr=p1*ss555.value; bb=p1 ; }
//if ( (ss555.value < 10) && (ss555.value > 5) ) {pr=p2*ss555.value; bb=p2 ; }
//if ( (ss555.value < 21) && (ss555.value > 9) ) {pr=p3*ss555.value; bb=p3 ; }
//if ( (ss555.value < 31) && (ss555.value > 19) ) {pr=p4*ss555.value; bb=p4 ; }
//if ( ss555.value > 30 ) {pr=p5*ss555.value; bb=p5 ; }
//
//$(bottle).update(bb);
//$(price).update(pr);
//       //$(price).innerHtml('444');
//
//	}
//
//
//function calc3(field,bottle,price,pp1,pp2,pp3,pp4,pp5,q) {
//        var ss555=$(field);
//       var p1=pp1;
//       var p2=pp2;
//       var p3=pp3;
//       var p4=pp4;
//       var p5=pp5;
//       var bb;
//       var pr;
//         if (q=='up') { ss555.value++; }
//         if (q=='down') { if (ss555.value > 3) { ss555.value--;} }
//
//if (ss555.value == 1 ) {pr=p1*ss555.value; bb=p1 ; }
//if  (ss555.value == 2)  {pr=p2*ss555.value; bb=p2 ; }
//if ( (ss555.value < 6) && (ss555.value > 2) ) {pr=p3*ss555.value; bb=p3 ; }
//if ( (ss555.value < 15) && (ss555.value > 5) ) {pr=p4*ss555.value; bb=p4 ; }
//if ( ss555.value > 14 ) {pr=p5*ss555.value; bb=p5 ; }
//
//$(bottle).update(bb);
//$(price).update(pr);
//       //$(price).innerHtml('444');
//
//	}
//
//function calcx1(field,bottle,price,pp1,pp2,pp3,pp4,pp5) {
//        var ss555=$(field);
//       var p1=pp1;
//       var p2=pp2;
//       var p3=pp3;
//       var p4=pp4;
//       var p5=pp5;
//   //     var ps = parseInt(ss555.value,10);
// var ps = parseInt(ss555.value.toString());
//if (isNaN(ps)) {
//ss555.value = 3; ps = 3;
//		}
//else {
//ss555.value = ps;
//		}
//        if (ss555.value < 1) {ss555.value=3}
//
//if (ps <= 5) { bb=p1;}
//if ((ps > 5) && (ps <= 9)) {bb=p2; }
//if ((ps > 9) && (ps <= 20) ) {bb=p3; }
//if ((ps > 19) && (ps <= 30)) {bb=p4; }
//if ( ps > 30) {bb=p5; }
//pr=bb*ps;
//    $(bottle).update(bb);
//    $(price).update(pr);
//       //$(price).innerHtml('444');
//
//	}
//
//function calcx3(field,bottle,price,pp1,pp2,pp3,pp4,pp5) {
//        var ss555=$(field);
//       var p1=pp1;
//       var p2=pp2;
//       var p3=pp3;
//       var p4=pp4;
//       var p5=pp5;
//       var bb;
//       var pr;
//
//         if (ss555.value < 1) {ss555.value='1'}
//
//if (ss555.value == 1 ) {pr=p1*parseInt(ss555.value); bb=p1 ; }
//if  (ss555.value == 2)  {pr=p2*parseInt(ss555.value); bb=p2 ; }
//if ( (ss555.value < 6) && (ss555.value > 2) ) {pr=p3*parseInt(ss555.value); bb=p3 ; }
//if ( (ss555.value < 15) && (ss555.value > 5) ) {pr=p4*parseInt(ss555.value); bb=p4 ; }
//if ( ss555.value > 14 ) {pr=p5*parseInt(ss555.value); bb=p5 ; }
//
//$(bottle).update(bb);
//$(price).update(pr);
//       //$(price).innerHtml('444');
//
//	}
//


function left_submenu(){

   // Effect.Appear('left_submenu');
    Effect.BlindDown('left_submenu', {duration: 0.5})


}

function left_submenu_up(){

   // Effect.Appear('left_submenu');
    Effect.BlindUp('left_submenu', {duration: 0.5})


}



function runSerial(id) {
	
                new Effect.Appear(id, { duration:1.0, from:0.0, to:1.0,
			queue: {position: 'end', scope: 'myqueue'} }),
                    new Effect.Fade(id, { duration:3.0, from:1.0, to:1.0,
			queue: {position: 'end', scope: 'myqueue'} }),
		new Effect.Fade(id, { duration:1.0, from:1.0, to:0.0,
			queue: {position: 'end', scope: 'myqueue'}  })
		
	;
}

function showsub(id) {
  var sub=$(id)
disp = sub.getStyle('display')
if (disp == 'none')
{
 new Effect.Appear(id, { duration:1.0, from:0.0, to:1.0})
}
}

//window.onload=function(){
//$('sel2').show();

//$('sel1').show();
//return

//}

function scroll_r(zp,n){
var zp_el=$(zp);
clip = zp_el.getStyle('margin-left');
marg=parseInt(clip);
off=56;
lim=(n-3)*off*(-1);
//alert(clip)
if (marg>lim)
{
lp=marg-off;
style={marginLeft: lp + 'px'};
zp_el.setStyle(style)}

}

function scroll_l(zp,n){
var zp_el=$(zp);
clip = zp_el.getStyle('margin-left');
marg=parseInt(clip);
off=56;
//lim=(n-3)*off;
//alert(clip)
if (marg<0)
{
lp=marg+off;
style={marginLeft: lp + 'px'};
zp_el.setStyle(style)}

}

function tog(zp){

$(zp).toggle()
}

function tog3(zp,zp2){
var zp_el=$(zp);
var zp_e2=$(zp2);
zp_el.toggle()
zp_e2.remove()
}

function tog2(zp){
var zp_el=$(zp);
zp2='p'+zp
var zp_e2=$(zp2);
zp_el.toggle();
color=zp_e2.getStyle('color');
//alert(color);
if(color=='rgb(167, 111, 176)')
{Element.setStyle(zp_e2, 'color:#5C2D91;')}

if(color=='rgb(92, 45, 145)') {
Element.setStyle(zp_e2, 'color:rgb(167, 111, 176)')}
}

function sort_act(t){
 var zp_el=$(t);
 Element.setStyle(zp_el, 'background: url("/images2/fiol_circle.gif") 0px -2px no-repeat;')
}

function tog2sort(zp){
var zp_el=$(zp);
var zp2=zp + 'a';
var zp3=zp + 'd';

var zp_e2=$(zp2);
var zp_e3=$(zp3);
var disp=zp_el.getStyle('display');
//alert(disp);
zp_el.toggle();
if(disp=='none') {
Element.setStyle(zp_e3, 'display:none;');
Element.setStyle(zp_e2, 'display:block;');
}

if(disp=='block') {
Element.setStyle(zp_e3, 'display:block;');
Element.setStyle(zp_e2, 'display:none;');
}
}

function tog_st(st){
var stdiv=$(st);
var sta=$('link_st');


var disp=stdiv.getStyle('display');
//alert(disp);
stdiv.toggle();
if(disp=='none') {
sta.innerHTML="Скрыть характеристики товара";
}

if(disp=='block') {
sta.innerHTML="Показать характеристики товара";
}
}

function show_pass(pass){
cont=$(pass);


cont.innerHTML='<input type="text" style="" size="30" name="user11[password]" id="user11_password">';



}


function zp(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'display:none')
}
function zp2(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'visibility:hidden')
}
function zp3(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'display:none')
Element.setStyle(zp_el, 'background-color:transparent')
}

function redir(list)
{
var selection = list.options[list.selectedIndex].value
if (selection != "None")
location.href = selection
}


function filtr(brend,id)
{
   if (brend== 1)
   location="/kt3/tg_n/"+id
   else
   location="/kt3/tg_n/"+id+"?filtr="+brend;
}
function filtr_v(brend,id)
{
   if (brend== 1)
   location="/kt3/tg_v/"+id
   else
   location="/kt3/tg_v/"+id+"?filtr="+brend;
}
function filtr1(brend,id,order)
{
    if (brend== '1')
    location="/kt3/tg_n/"+id+"?order="+order;
    else
    location="/kt3/tg_n/"+id+"?filtr="+brend+"&order="+order;

}
function filtr1_v(brend,id,order)
{
    if (brend== '1')
    location="/kt3/tg_v/"+id+"?order="+order;
    else
    location="/kt3/tg_v/"+id+"?filtr="+brend+"&order="+order;

}

function filtr1_v2(brend,id,order,path)
{
    if (brend== '1')
    location="/kt3/"+path+"/"+id+"?order="+order;
    else
    location="/kt3/"+path+"/"+id+"?filtr="+brend+"&order="+order;

}

function filtr1_n2(brend,id,order)
{
    if (brend== '1')
    location="/kt3/tg_n2/"+id+"?order="+order;
    else
    location="/kt3/tg_n2/"+id+"?filtr="+brend+"&order="+order;

}


function filtr1_beauty(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'visibility: visible');
}
function vis(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'display: block');
Element.setStyle(zp_el, 'background-color:#FFFFCC;')
}

function show_id(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'display: block');
}

function show_hide_id(zp,zp2){
var zp_el=$(zp);
var zp_el2=$(zp2);
Element.setStyle(zp_el, 'display: block');
Element.setStyle(zp_el2, 'display: none');
}
function show_show_hide_id(zp3,zp,zp2){
var zp_el=$(zp);
var zp_el2=$(zp2);
var zp_el3=$(zp3);
Element.setStyle(zp_el3, 'display: block');
Element.setStyle(zp_el, 'display: block');
Element.setStyle(zp_el2, 'display: none');
}


function hide_show_id(zp,zp2){
var zp_el=$(zp2);
var zp_el2=$(zp);
Element.setStyle(zp_el, 'display: block');
Element.setStyle(zp_el2, 'display: none');
}

function hide_hide_show_id(zp3,zp,zp2){
var zp_el=$(zp2);
var zp_el2=$(zp);
var zp_el3=$(zp3);
Element.setStyle(zp_el, 'display: block');
Element.setStyle(zp_el2, 'display: none');
Element.setStyle(zp_el3, 'display: none');
}

function back_size(zp){
var zp_el=$(zp);
Element.setStyle(zp_el, 'width: 50px');
Element.setStyle(zp_el, 'height: 50px');
}

function perp(perp)
{

    location="/perpage/?per_page="+perp;
}

function perp_k(perp)
{

    location="/perpage_k/?per_page="+perp;
}

function toggle_changecolor(q,a){
el_q=$(q);
el_a=$(a);

disp=el_a.getStyle('display');
//alert(disp);
el_a.toggle();
if(disp=='none') {
Element.setStyle(el_q, 'font-weight: bold;font-style: normal;');
}

if(disp=='block') {
Element.setStyle(el_q, 'font-weight: normal;font-style: italic;');
}
}


//function setColor()
//{
     //$('games_banner1').innerHTML+='wwwwww';
    //alert('777777');
  //$('pkd1').setStyle({ background-image:url(/images/1chb.jpg);})
// setStyle($('pkd1'),{background-image:url(/images/1chb.jpg)} )
//}


//==========================================
/*
(function() { 
    if (window.addEventListener) window.addEventListener("load", init, false);
    else if (window.attachEvent) window.attachEvent("onload", init);

    
    function init() {
       
        
        for(var i = 0; i < document.forms.length; i++) {
            var f = document.forms[i];

          
            var needsValidation = false;

            
            for(j = 0; j < f.elements.length; j++) {
                var e = f.elements[j];  

               
                if (e.type != "text") continue;

                
                var pattern = e.getAttribute("pattern");
                
                var required = e.getAttribute("required") != null;

               
                if (required && !pattern) {
                    pattern = "\\S";
                    e.setAttribute("pattern", pattern);
                }

              
                if (pattern) {
                  
                    e.onchange = validateOnChange;
                   
                    needsValidation = true;
                }
            }

           
            if (needsValidation) f.onsubmit = validateOnSubmit;
        }
    }

    
    function validateOnChange() {
        var textfield = this;                            // the textfield
        var pattern = textfield.getAttribute("pattern"); // the pattern
        var value = this.value;                          // the user's input

     
        if (value.search(pattern) == -1) textfield.className = "invalid";
        else textfield.className = "valid";
    }

    
    function validateOnSubmit() {
      
        var invalid = false; 
     
        for(var i = 0; i < this.elements.length; i++) {
            var e = this.elements[i];
            
            if (e.type == "text" && e.onchange == validateOnChange) {
                e.onchange(); 
             
                if (e.className == "invalid") invalid = true;
            }
        }

       
        if (invalid) {
            alert("Неправильно заполнена форма.\n" +
                  "Пожалуйста обратите внимания на поля красного цвета.");
            return false;
        }
    }
})();

*/

//==============================================================