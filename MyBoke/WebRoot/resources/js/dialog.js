function tm_dialoag(options){
		var defaults = {
			title:"提示",
			content:"请输入内容 ！",
			width:460,
			height:220,
			sureText:"确定",
			cancleText:"取消",
			showButton:true,
			callback:function(){}
	};
	var opts = $.extend({},defaults,options);
	$("body").append("<div class='b_l w460' id='dialogbox'>"+
	"	<div class='bcom_ti'>"+
	"		<a href='javascript:void(0);' class='bide layer_icon close fr'></a> <span>"+opts.title+"</span>"+
	"	</div>"+
	"	<div class='bcom_cent'>"+
	"		<p class='bcomti'>"+opts.content+"</p>"+
	"		<p class='bcoma'>"+
	"			<a href='javascript:void(0);' class='bc_abut1 sure'>"+opts.sureText+"</a>"+
	"			<a href='javascript:void(0);' class='bc_abut2 close'>"+opts.cancleText+"</a>"+
	"		</p>"+
	"	</div>"+
	"</div>").append("<div class='tmui-overlay' style='height:"+$(window).height()+"px'></div>");
	var $dialog = $("#dialogbox");
	if(!opts.showButton)$dialog.find(".bcoma").remove();
	$dialog.width(opts.width);
	$dialog.height(opts.height);
	tm_center_dialog($dialog);
	//关闭按钮绑定点击事件
	$dialog.find(".close").click(function(){
		$dialog.next().remove();//删除遮罩层
		$dialog.slideUp("slow",function(){
			$(this).remove();
		});	
		if(opts.callback)opts.callback(false);
	});
	$dialog.find(".sure").click(function(){
		$dialog.next().remove();//删除遮罩层
		$dialog.slideUp("slow",function(){
			$(this).remove();
		});	
		if(opts.callback)opts.callback(true);
	});
	//窗口resize
	$(window).resize(function(){
		tm_center_dialog($dialog);
	});
};

//层居中
function tm_center_dialog($dialog){
	var windowWidth = $(window).width();
	var windowHeight = getClientHeight();
	var dialogWidth = $dialog.width();
	var dialogHeight = $dialog.height();
	var left = (windowWidth-dialogWidth)/2;
	var top =  (windowHeight-dialogHeight)/2;
	$dialog.css({left:left,top:top});
};


function getClientHeight() {
	var clientHeight = 0;
	if (document.body.clientHeight && document.documentElement.clientHeight) {
		clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight
				: document.documentElement.clientHeight;
	} else {
		clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight
				: document.documentElement.clientHeight;
	}
	return clientHeight;
};