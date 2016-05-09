function document.oncontextmenu(){event.returnValue=false;}//ÆÁ±ÎÊó±êÓÒ¼ü 
function document.onselectstart(){event.returnValue=false;}//ÆÁ±ÎÊó±êÑ¡Ôñ
function window.onhelp(){return false} //ÆÁ±ÎF1°ïÖú 
function document.onmousewheel()//ÆÁ±ÎShift+¹öÂÖ,Ctrl+¹öÂÖ
{
	if(event.shiftKey || event.ctrlKey)
	{
		event.keyCode=0; 
		event.returnValue=false; 		
	}
}
function document.onkeydown() 
{ 
  if ((window.event.altKey)&& 
      ((window.event.keyCode==37)||   //ÆÁ±Î Alt+ ·½Ïò¼ü ¡û 
       (window.event.keyCode==39)))   //ÆÁ±Î Alt+ ·½Ïò¼ü ¡ú 
  { 
     event.returnValue=false; 
  } 
  if ((event.keyCode==116)||               //ÆÁ±Î F5 Ë¢ĞÂ¼ü
      (event.ctrlKey && event.keyCode==82)){ //Ctrl + R 
     event.keyCode=0; 
     event.returnValue=false; 
     } 
  if(event.keyCode==32 || event.keyCode==8)	//ÆÁ±×¿Õ¸ñ¼ü,ºóÍË¼ü
  {
    if(!(event.srcElement.tagName=="INPUT" && event.srcElement.type=="text") && event.srcElement.tagName!="TEXTAREA")
    {
     event.keyCode=0; 
     event.returnValue=false; 
    }
  }
  if (event.keyCode==27){event.keyCode=0;event.returnValue=false;}  //ÆÁ±ÎESC
  
  if (event.keyCode==114){event.keyCode=0;event.returnValue=false;}  //ÆÁ±ÎF3
  if (event.keyCode==122){event.keyCode=0;event.returnValue=false;}  //ÆÁ±ÎF11
  if(event.ctrlKey && event.keyCode==67) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+c
  if(event.ctrlKey && event.keyCode==86) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+v
  if(event.ctrlKey && event.keyCode==70) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+f
  if(event.ctrlKey && event.keyCode==87) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+w
  if(event.ctrlKey && event.keyCode==69) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+e
  if(event.ctrlKey && event.keyCode==72) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+h
  if(event.ctrlKey && event.keyCode==73) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+i
  if(event.ctrlKey && event.keyCode==79) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+o
  if(event.ctrlKey && event.keyCode==76) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+l
  if(event.ctrlKey && event.keyCode==80) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+p
  if(event.ctrlKey && event.keyCode==66) {event.keyCode=0;event.returnValue=false;}	//ÆÁ±Î Ctrl+b
  if (event.ctrlKey && event.keyCode==78) {event.keyCode=0;event.returnValue=false;}  //ÆÁ±Î Ctrl+n
  if (event.shiftKey && event.keyCode==121){event.keyCode=0;event.returnValue=false;}  //ÆÁ±Î shift+F10 
  if (window.event.srcElement.tagName == "A" && window.event.shiftKey) {event.keyCode=0;event.returnValue=false;}             //ÆÁ±Î shift ¼ÓÊó±ê×ó¼üĞÂ¿ªÒ»ÍøÒ³ 
} 