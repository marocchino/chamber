$(document).ready(function(){
	//for write
	$.get("/write",function(data){
		$('#write').html(data);
		$('#write #submit').click(function(){
			$(".error").hide();
			var hasError = false;
			var titleVal = $('#title').val();
			var contentVal = $('#content').val();
			var keyVal = $('#key').val();
			var passwordVal = $('#password').val();
			if(titleVal == ''){
				$('#title').after('<span class="error">title must be not null</span>');
				hasError = true;
			};
			if(contentVal == ''){
				$('#content').after('<span class="error"><br/  >content must be not null</span>');
				hasError = true;
			};
			if(!hasError){
				$.post("/write",{ title: titleVal, content: contentVal, key: keyVal, password: passwordVal },function(data){
					$("#message").html(data).show(1000);
					$.get("/list",function(data){
						$('#list').html(data);
					});
					$('#title').val('');
					$('#password').val('');
					$('#content').val('');
				});
			};
			return false;
		});
	});
	$.get("/list",function(data){
		$('#list').html(data);
	});
});

//for edit 
var edit = function(obj){
	$.get("/edit",{key:obj},function(data){
		$('#'+obj).html(data);
		var objSize = $('#'+obj+" :input").length;
		$('#'+obj+" :input:eq("+(objSize-1)+")").click(function(){
			$(".error").hide();
			var hasError = false;
			var titleId = '#'+obj+' :input:eq(0)';
			var contentId = '#'+obj+' :input:eq('+(objSize-2)+')';
			var titleVal = $(titleId).val();
			var contentVal = $(contentId).val();
			var keyVal = obj;
			var passwordVal = '';
			if(objSize == 4){
				var passwordId = '#'+obj+' :input:eq(1)';
				passwordVal = $(passwordId).val();
				if(passwordVal == ''){
					$(passwordId).after('<span class="error"><br/  >password must be not null</span>');
					hasError = true;
				};
			};
			if(titleVal == ''){
				$(titleId).after('<span class="error">title must be not null</span>');
				hasError = true;
			};
			if(contentVal == ''){
				$(contentId).after('<span class="error"><br/  >content must be not null</span>');
				hasError = true;
			};
			
			if(!hasError){
				$.post("/edit",{ title: titleVal, content: contentVal, key: keyVal, password: passwordVal },function(data){
					$("#message").html(data).show(1000);
					$.get("/list",function(data){
						$('#list').html(data);
					});
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
				$.get("/list",function(list){
					$('#list').html(list);
				});
			});
			return false;
		});
	});
};