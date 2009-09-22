$(document).ready(function(){
	
	//get page number
	var pageNumber = 1;
	var urlString = (window.location.href).split("#");
	if(urlString[1]){
		aguments = urlString[1].split("=");
		pageNumber = aguments[1];
	};
	
	//for write
	$.get("/write",function(data){
		$('#write').html(data);
		$("#write form").bind('submit', function(event){
			event.preventDefault();
			$(".error").hide();
			var hasError = false;
			var titleVal = $(this['title']).val();
			var contentVal = $(this['content']).val();
			var keyVal = $(this['key']).val();
			var passwordVal = $(this['password']).val();
			if(titleVal == ''){
				$(this['title']).after('<span class="error">title must be not null</span>');
				hasError = true;
			};
			if(contentVal == ''){
				$(this['content']).after('<span class="error"><br/  >content must be not null</span>');
				hasError = true;
			};
			if(!hasError){
				var frm = this;
				$.post("/write",{ title: titleVal, content: contentVal, key: keyVal, password: passwordVal },function(data){
					$("#message").html(data).show(1000);
					goPage(1);
					$(frm['title']).val('');
					$(frm['password']).val('');
					$(frm['content']).val('');
				});
			};
			return false;
		});
	});
	goPage(pageNumber);
});


var goPage = function(pageNumber){
	$.get('/list',{page:pageNumber},function(data){
		$('#list').html(data);
		window.location.replace("#page="+pageNumber);
	});
};

//for edit 
var edit = function(obj){
	$.get("/edit",{key:obj},function(data){
		$('#'+obj).html(data);
		var objSize = $('#'+obj+" :input").length;
		$('#'+obj+" form").bind('submit', function(event){
			$(".error").hide();
			var hasError = false;
			var titleVal = $(this['title']).val();
			var contentVal = $(this['content']).val();
			var keyVal = obj;
			var passwordVal = '';
			if(objSize == 4){
				passwordVal = $(this['password']).val();
				if(passwordVal == ''){
					$(this['password']).after('<span class="error"><br/  >password must be not null</span>');
					hasError = true;
				};
			};
			if(titleVal == ''){
				$(this['title']).after('<span class="error">title must be not null</span>');
				hasError = true;
			};
			if(contentVal == ''){
				$(this['content']).after('<span class="error"><br/  >content must be not null</span>');
				hasError = true;
			};
			
			if(!hasError){
				$.post("/edit",{ title: titleVal, content: contentVal, key: keyVal, password: passwordVal },function(data){
					$("#message").html(data).show(1000);
					goPage(1);
				});
			};
			return false;
		});
	});
};


var del = function(obj){
	$.get("/del",{key:obj},function(data){
		$('#'+obj).html(data);
		$('#'+obj+" :input:eq(1)").click(function(){
			$(".error").hide();
			passwordVal = $('#'+obj+" :input:eq(0)").val();
			$.post("/del",{ key: obj, password: passwordVal },function(data){
				$("#message").html(data).show(1000);
				alert(data);
				goPage(pageNumber);
			});
			return false;
		});
	});
};