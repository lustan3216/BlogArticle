function getInfo()
{
  var s = "";
  s += " 網頁可見區域寬："+ document.body.clientWidth;
  s += " 網頁可見區域高："+ document.body.clientHeight;
  s += " 網頁可見區域寬："+ document.body.offsetWidth + " (包括邊線和捲軸的寬)";
  s += " 網頁可見區域高："+ document.body.offsetHeight + " (包括邊線的寬)";
  s += " 網頁正文全文寬："+ document.body.scrollWidth;
  s += " 網頁正文全文高："+ document.body.scrollHeight;
  s += " 網頁被卷去的高(ff)："+ document.body.scrollTop;
  s += " 網頁被卷去的高(ie)："+ document.documentElement.scrollTop;
  s += " 網頁被卷去的左："+ document.body.scrollLeft;
  s += " 網頁正文部分上："+ window.screenTop;
  s += " 網頁正文部分左："+ window.screenLeft;
  s += " 螢幕解析度的高："+ window.screen.height;
  s += " 螢幕解析度的寬："+ window.screen.width;
  s += " 螢幕可用工作區高度："+ window.screen.availHeight;
  s += " 螢幕可用工作區寬度："+ window.screen.availWidth;
  s += " 你的螢幕設置是 "+ window.screen.colorDepth +" 位彩色";
  s += " 你的螢幕設置 "+ window.screen.deviceXDPI +" 像素/英寸";
  s += " 這個elecment離上螢幕匡的邊 "+ some_element.getBoundingClientRect().top ;
  //alert (s);
}
//get this x,y座標
var X= this.getBoundingClientRect().left+document.documentElement.scrollLeft;
var Y =this.getBoundingClientRect().top+document.documentElement.scrollTop;


// getBoundingClientRect用于获得页面中某个元素的左，上，右和下分别相对浏览器视窗的位置。
// getBoundingClientRect是DOM元素到浏览器可视范围的距离（不包含文档卷起的部分）。
// 该函数返回一个Object对象，该对象有6个属性：top,lef,right,bottom,width,height；
// 这里的top、left和css中的理解很相似，width、height是元素自身的宽高，但是right，bottom和css中的理解有点不一样。
// right是指元素右边界距窗口最左边的距离，bottom是指元素下边界距窗口最上面的距离。
