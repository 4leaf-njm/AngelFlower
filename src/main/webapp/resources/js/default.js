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
