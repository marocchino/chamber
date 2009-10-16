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
		
		/// TinyMCE script ///
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : '/js/tiny_mce/tiny_mce.js',

			// General options
			theme : "advanced",
			plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

			// Theme options
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,

			// Example content CSS (should be your site CSS)
			content_css : "css/content.css",

			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",
			
			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
		/// TinyMCE script ///
		
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

//for del
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