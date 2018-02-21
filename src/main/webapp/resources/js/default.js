function comma(num){
    var len, point, str;  
    num = num + "";  
    point = num.length % 3 ;
    len = num.length;  
    str = num.substring(0, point);  
    while (point < len) {  
        if (str != "") str += ",";  
        str += num.substring(point, point + 3);  
        point += 3;  
    }  
    return str;
}

function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function readURL(input, selector) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$(selector).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function setCookie(cookie_name, value, days) {
	console.log(cookie_name + ' ' + value + ' ' + days);
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + days);
	
    var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	document.cookie = cookie_name + '=' + cookie_value;
}

function getCookie(cookie_name) {
     var x, y;
     var val = document.cookie.split(';');

     for (var i = 0; i < val.length; i++) {
       x = val[i].substr(0, val[i].indexOf('='));
       y = val[i].substr(val[i].indexOf('=') + 1);
       x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거
       if (x == cookie_name) {
         return unescape(y); 
       }
    }
}

function addCookie(id) {
  var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
  var maxItemNum = 5; // 최대 저장 가능한 아이템개수
  var expire = 7; // 쿠키값을 저장할 기간
  if (items) {
    var itemArray = items.split(',');
    if (itemArray.indexOf(id) != -1) {
      // 이미 존재하는 경우 종료
      console.log('Already exists.');
    }
    else {
      // 새로운 값 저장 및 최대 개수 유지하기
      itemArray.unshift(id);
      if (itemArray.length > maxItemNum ) itemArray.length = 5;
      items = itemArray.join(',');
      setCookie('productItems', items, expire);
    }
  }
  else {
    // 신규 id값 저장하기
    setCookie('productItems', id, expire);
  }
}