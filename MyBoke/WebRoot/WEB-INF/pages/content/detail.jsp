<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!doctype html>
<html>
<head>
 	<meta charset="UTF-8">
 	<meta name="Generator" content="EditPlus®">
 	<meta name="Author" content="">
 	<meta name="Keywords" content="">
 	<meta name="Description" content="">
 	<title>${content.title}-king博客</title>
 	<%@include file="/WEB-INF/pages/common/common.jsp"%>
 	<link rel="stylesheet" href="${basePath}/resources/css/global.css">
 	<link rel="stylesheet" href="${basePath}/resources/css/UI.css">
</head>
<body data-opid="${content.id}">
	<%@include file="/WEB-INF/pages/common/header.jsp"%>
    <div class="content">
    	<div class="wth1200 clearfix">
        	<div class="fl cont_left">
               <div class="cont_head">
                    <div class="conte_title overflow">${content.title}</div>
                    <div class="Classification">
                        <span class="tage">原创作品</span>
                        <span>分类：<a href="javascript:void(0);">${content.tag}</a></span>
                        <span> 
                        	<i class="iconfont icon-time font18" style="margin-right:6px;"></i>
                        		${king:formatDate(content.createTime,'yyyy-MM-dd HH:mm:ss')}
                        </span>
                    </div>
                    <div class="Classification">
                        <span class="Operation">浏览数<i>(${content.hits})</i></span>
                        <span class="Operation">收藏<i>(${content.collections})</i></span>
                        <span class="Operation">点赞<i>(${content.loves})</i></span>
                        <span class="Operation">评论<i>(${content.comments})</i></span>
                        <span class="Operation">作者<i>(${content.userName})</i></span>
                    </div>
                    <div class="tag-star tag-star1" title="首页推荐">
                    	<img src="${basePath}/resources/imgs/share/tag-star1.png" alt="首页推荐">
                    </div>
                    <div class="hot">
						<i class="iconfont icon-hot"></i>
						<span class="num">${content.hits}<strong>。</strong></span>
					</div>
                </div>
                <div class="cont_details">
                   ${content.content}
                </div>
                <div class="comment_box bg_white clearfix">
                    <div class="fl share_box">
                        <ul class="clearfix">
                            <li><a href="javascript:void(0)" title="分享到QQ"></a></li>
                            <li><a href="javascript:void(0)" title="分享到微信"></a></li>
                            <li><a href="javascript:void(0)" title="分享到空间"></a></li>
                            <li><a href="javascript:void(0)" title="分享到微博"></a></li>
                        </ul>快分享给朋友吧！
                    </div>
                    <div class="fl praise">
                    	<a href="javascript:void(0)" data-loves="${content.loves}" data-opid="${content.id}" onclick="changeLoves(this);">赞</a>
                    	${content.loves}人已经点赞
                    </div>
                    <div class="fr collect_box" style="text-align: center;">
                        <a href="javascript:void(0)" data-collections="${content.collections}" data-opid="${content.id}" onclick="changeCollections(this);">点击收藏</a>
                        ${content.collections}人已经收藏
                    </div>
                </div>
                <div class="pingl_box bg_white">
                    <div class="clearfix login_hint">
                        <p>大牛，别默默的看了，快登录帮我点评一下吧！:)</p>
                        <a href="${basePath}/user/toLogin.do" class="primary_btn">登录</a>
                        <a href="${basePath}/user/toRegist.do" class="nature_btn">立即注册</a>
                    </div>
                    
                    <div class="t_box">
                    	<input type="hidden" id="userName" value="<%=request.getSession().getAttribute("userName")%>">
						<input type="hidden" id="headerPic" value="<%=request.getSession().getAttribute("userHeaderPic")%>">
						<div class="t_msg" contenteditable="true" onkeyup="setCacheData(this)"></div> 
						<p class="t_face">
							<a href="javascript:void(0);" class="t_face_btn">
								<img src="${basePath}/resources/imgs/face/cza_thumb.gif" alt="表情" width="22" height="22" />
								<span class="facemotion">表情</span>
							</a>
							<a href="javascript:void(0);" class="t_send_btn" onclick="saveComment(this);"> 评 论</a>
						</p>
						<div class="t_face_con">
							<ul id="q_ul">
								<li><img src="${basePath}/resources/imgs/face/zz2_thumb.gif" title="[织]" width="22" height="22"></li>
								<li><img src="${basePath}/resources/imgs/face/horse2_thumb.gif" title="[神马]"></li>
								<li><img src="${basePath}/resources/imgs/face/fuyun_thumb.gif" title="[浮云]"></li>
								<li><img src="${basePath}/resources/imgs/face/geili_thumb.gif" title="[给力]"></li>
								<li><img src="${basePath}/resources/imgs/face/wg_thumb.gif" title="[围观]"></li>
								<li><img src="${basePath}/resources/imgs/face/vw_thumb.gif" title="[威武]"></li>
								<li><img src="${basePath}/resources/imgs/face/panda_thumb.gif" title="[熊猫]"></li>
								<li><img src="${basePath}/resources/imgs/face/rabbit_thumb.gif" title="[兔子]"></li>
								<li><img src="${basePath}/resources/imgs/face/otm_thumb.gif" title="[奥特曼]"></li>
								<li><img src="${basePath}/resources/imgs/face/j_thumb.gif" title="[囧]"></li>
								<li><img src="${basePath}/resources/imgs/face/hufen_thumb.gif" title="[互粉]"></li>
								<li><img src="${basePath}/resources/imgs/face/liwu_thumb.gif" title="[礼物]"></li>
								<li><img src="${basePath}/resources/imgs/face/smilea_thumb.gif" title="[呵呵]"></li>
								<li><img src="${basePath}/resources/imgs/face/tootha_thumb.gif" title="[嘻嘻]"></li>
								<li><img src="${basePath}/resources/imgs/face/laugh.gif" title="[哈哈]"></li>
								<li><img src="${basePath}/resources/imgs/face/tza_thumb.gif" title="[可爱]"></li>
								<li><img src="${basePath}/resources/imgs/face/kl_thumb.gif" title="[可怜]"></li>
								<li><img src="${basePath}/resources/imgs/face/kbsa_thumb.gif" title="[挖鼻屎]"></li>
								<li><img src="${basePath}/resources/imgs/face/cj_thumb.gif" title="[吃惊]"></li>
								<li><img src="${basePath}/resources/imgs/face/shamea_thumb.gif" title="[害羞]"></li>
								<li><img src="${basePath}/resources/imgs/face/zy_thumb.gif" title="[挤眼]"></li>
								<li><img src="${basePath}/resources/imgs/face/bz_thumb.gif" title="[闭嘴]"></li>
								<li><img src="${basePath}/resources/imgs/face/bs2_thumb.gif" title="[鄙视]"></li>
								<li><img src="${basePath}/resources/imgs/face/lovea_thumb.gif" title="[爱你]"></li>
								<li><img src="${basePath}/resources/imgs/face/sada_thumb.gif" title="[泪]"></li>
								<li><img src="${basePath}/resources/imgs/face/heia_thumb.gif" title="[偷笑]"></li>
								<li><img src="${basePath}/resources/imgs/face/qq_thumb.gif" title="[亲亲]"></li>
								<li><img src="${basePath}/resources/imgs/face/sb_thumb.gif" title="[生病]"></li>
								<li><img src="${basePath}/resources/imgs/face/mb_thumb.gif" title="[太开心]"></li>
								<li><img src="${basePath}/resources/imgs/face/ldln_thumb.gif" title="[懒得理你]"></li>
								<li><img src="${basePath}/resources/imgs/face/yhh_thumb.gif" title="[右哼哼]"></li>
								<li><img src="${basePath}/resources/imgs/face/zhh_thumb.gif" title="[左哼哼]"></li>
								<li><img src="${basePath}/resources/imgs/face/x_thumb.gif" title="[嘘]"></li>
								<li><img src="${basePath}/resources/imgs/face/cry.gif" title="[衰]"></li>
								<li><img src="${basePath}/resources/imgs/face/wq_thumb.gif" title="[委屈]"></li>
								<li><img src="${basePath}/resources/imgs/face/t_thumb.gif" title="[吐]"></li>
								<li><img src="${basePath}/resources/imgs/face/k_thumb.gif" title="[打哈气]"></li>
								<li><img src="${basePath}/resources/imgs/face/bba_thumb.gif" title="[抱抱]"></li>
								<li><img src="${basePath}/resources/imgs/face/angrya_thumb.gif" title="[怒]"></li>
								<li><img src="${basePath}/resources/imgs/face/yw_thumb.gif" title="[疑问]"></li>
								<li><img src="${basePath}/resources/imgs/face/cza_thumb.gif" title="[馋嘴]"></li>
								<li><img src="${basePath}/resources/imgs/face/88_thumb.gif" title="[拜拜]"></li>
								<li><img src="${basePath}/resources/imgs/face/sk_thumb.gif" title="[思考]"></li>
								<li><img src="${basePath}/resources/imgs/face/sweata_thumb.gif" title="[汗]"></li>
								<li><img src="${basePath}/resources/imgs/face/sleepya_thumb.gif" title="[困]"></li>
								<li><img src="${basePath}/resources/imgs/face/sleepa_thumb.gif" title="[睡觉]"></li>
								<li><img src="${basePath}/resources/imgs/face/money_thumb.gif" title="[钱]"></li>
								<li><img src="${basePath}/resources/imgs/face/sw_thumb.gif" title="[失望]"></li>
								<li><img src="${basePath}/resources/imgs/face/cool_thumb.gif" title="[酷]"></li>
								<li><img src="${basePath}/resources/imgs/face/hsa_thumb.gif" title="[花心]"></li>
								<li><img src="${basePath}/resources/imgs/face/hatea_thumb.gif" title="[哼]"></li>
								<li><img src="${basePath}/resources/imgs/face/gza_thumb.gif" title="[鼓掌]"></li>
								<li><img src="${basePath}/resources/imgs/face/dizzya_thumb.gif" title="[晕]"></li>
								<li><img src="${basePath}/resources/imgs/face/bs_thumb.gif" title="[悲伤]"></li>
								<li><img src="${basePath}/resources/imgs/face/crazya_thumb.gif" title="[抓狂]"></li>
								<li><img src="${basePath}/resources/imgs/face/h_thumb.gif" title="[黑线]"></li>
								<li><img src="${basePath}/resources/imgs/face/yx_thumb.gif" title="[阴险]"></li>
								<li><img src="${basePath}/resources/imgs/face/nm_thumb.gif" title="[怒骂]"></li>
								<li><img src="${basePath}/resources/imgs/face/hearta_thumb.gif" title="[心]"></li>
								<li><img src="${basePath}/resources/imgs/face/unheart.gif" title="[伤心]"></li>
								<li><img src="${basePath}/resources/imgs/face/pig.gif" title="[猪头]"></li>
								<li><img src="${basePath}/resources/imgs/face/ok_thumb.gif" title="[ok]"></li>
								<li><img src="${basePath}/resources/imgs/face/ye_thumb.gif" title="[耶]"></li>
								<li><img src="${basePath}/resources/imgs/face/good_thumb.gif" title="[good]"></li>
								<li><img src="${basePath}/resources/imgs/face/no_thumb.gif" title="[不要]"></li>
								<li><img src="${basePath}/resources/imgs/face/z2_thumb.gif" title="[赞]"></li>
								<li><img src="${basePath}/resources/imgs/face/come_thumb.gif" title="[来]"></li>
								<li><img src="${basePath}/resources/imgs/face/sad_thumb.gif" title="[弱]"></li>
								<li><img src="${basePath}/resources/imgs/face/lazu_thumb.gif" title="[蜡烛]"></li>
								<li><img src="${basePath}/resources/imgs/face/clock_thumb.gif" title="[钟]"></li>
								<li><img src="${basePath}/resources/imgs/face/cake.gif" title="[蛋糕]"></li>
								<li><img src="${basePath}/resources/imgs/face/m_thumb.gif" title="[话筒]"></li>
								<li><img src="${basePath}/resources/imgs/face/weijin_thumb.gif" title="[围脖]"></li>
								<li><img src="${basePath}/resources/imgs/face/lxhzhuanfa_thumb.gif" title="[转发]"></li>
								<li><img src="${basePath}/resources/imgs/face/lxhluguo_thumb.gif" title="[路过这儿]"></li>
								<li><img src="${basePath}/resources/imgs/face/bofubianlian_thumb.gif" title="[bofu变脸]"></li>
								<li><img src="${basePath}/resources/imgs/face/gbzkun_thumb.gif" title="[gbz困]"></li>
								<li><img src="${basePath}/resources/imgs/face/boboshengmenqi_thumb.gif" title="[生闷气]"></li>
								<li><img src="${basePath}/resources/imgs/face/chn_buyaoya_thumb.gif" title="[不要啊]"></li>
								<li><img src="${basePath}/resources/imgs/face/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li>
								<li><img src="${basePath}/resources/imgs/face/cat_yunqizhong_thumb.gif" title="[运气中]"></li>
								<li><img src="${basePath}/resources/imgs/face/youqian_thumb.gif" title="[有钱]"></li>
								<li><img src="${basePath}/resources/imgs/face/cf_thumb.gif" title="[冲锋]"></li>
								<li><img src="${basePath}/resources/imgs/face/camera_thumb.gif" title="[照相机]"></li>
							</ul>
						</div>
					</div>
					<!-- 评论内容框  -->
                    <div class="comment_cont"></div>
                </div>
            </div>
            <script type="text/javascript">
           $(function(){
        	   loadComment(0,5);
           });
            // 加载评论数据
            function loadComment(pageNo,pageSize){
            	var timer = null;
            	clearTimeout(timer);
				timer = setTimeout(function(){
					var contentId = $("body").data("opid");
					var params = {pageNo:pageNo*pageSize,pageSize:pageSize,contentId:contentId};
					$.ajax({
						type:"post",
						data:params,
						url:basePath+"/comment/load.do",
						success:function(dataArr){
							if(dataArr && dataArr.length>0){
								for(var i=0,len=dataArr.length;i<len;i++){
									var data = dataArr[i];
									$(".comment_cont").append("<div class='single_comment clearfix'>"+
		"                            <a href='javascript:void(0)' class='single_img fl'><img src='"+basePath+data.headerPic+"' width='60' height='60'></a>"+
		"                            <div class='fl single_cont'>"+
		"                                <p class='single_name'><a href='javascript:void(0)'>"+data.username+"</a><i>"+data.createTime+"</i></p>"+
		"                                <p class='yijian'>"+data.description+"</p>"+
		"                                <p class='huifu'>"+
		"                                   <a href='javascript:void(0)' onclick='replay(this);' data-opid=''>回复</a>"+
		"                                   <a href='javascript:void(0)' class=''>分享</a> "+
		"                                </p>"+
		"                                <p class='fbpl'></p>"+
		"                            </div>"+
		"                        </div>");
		 						}
							}
						}
					});
				},300);
			}
            
            // 设置缓存
            function setCacheData(obj){
            	var content = $(".t_msg").html();
        		if(isNotEmpty(content)){
        			if(window.localStorage){
        				localStorage.setItem("king",content);
        			}
        		}
        	};
         	// 保存评论
        	function saveComment(obj){
        		var content = $(".t_msg").html();
        		var contentId = $("body").data("opid");
        		var username = $("#userName").val();
        		var headerPic = $("#headerPic").val();
        		if(!content){
        			loading("请输入评论信息...",4);
        			$(".t_msg").focus();
        			return;
        		}
        		var params = {description:content,contentId:contentId};
        		//清空并且获取焦点
        		$(".t_msg").html("").focus();
        		$.ajax({
        			type:"post",
        			data:params,
        			url:basePath+"/comment/save.do",
        			success:function(data){
        				$(".comment_cont").prepend("<div class='single_comment clearfix animated rollIn'>"+
"                            <a href='javascript:void(0)' class='single_img fl'><img src='"+basePath+headerPic+"' width='60' height='60'></a>"+
"                            <div class='fl single_cont'>"+
"                                <p class='single_name'><a href='javascript:void(0)'>"+username+"</a><i>刚刚</i></p>"+
"                                <p class='yijian'>"+content+"</p>"+
"                                <p class='huifu'>"+
"                                   <a href='javascript:void(0)' onclick='replay(this);' data-opid=''>回复</a>"+
"                                   <a href='javascript:void(0)' class=''>分享</a> "+
"                                </p>"+
"                                <p class='fbpl'></p>"+
"                            </div>"+
"                        </div>");
        				 if(window.localStorage){
        					localStorage.removeItem("king");
        				} 
        			}
        		});
        	};
        	
        	// 回复评论
        	function replayComment(obj){
        		alert(1);
        	};
            </script>
            
            <div class="fr cont_right">
                <div class="personal">
                    <p>
                        <a href="javascript:void(0)" class="user_img"><img src="${basePath}${content.headerPic}" width="100" height="100"></a>
                    </p>
                    <p style="margin-bottom:10px;"><a href="javascript:void(0)" class="font18">${content.userName}</a></p>
                    <a href="javascript:void(0)" class="add_tb">+</a>
                    <div class="attention_box clearfix">
                        <a href="javascript:void(0)" class="fens">
                            <i>粉丝</i><br>
                            <b>3</b>
                        </a>
                        <a href="javascript:void(0)" class="guanz">
                            <i>关注</i><br>
                            <b>15</b>
                        </a>
                    </div>
                </div>
                <div class="praise_box clearfix">
                    <a href="javascript:void(0)" class="fens">
                        <i>已赞</i><br>
                        <b>${content.loves}</b>
                    </a>
                    <a href="javascript:void(0)" class="guanz">
                        <i>评论</i><br>
                        <b>${content.comments}</b>
                    </a>
                </div>
            </div>
        </div>
    </div> 
    <%@include file="/WEB-INF/pages/common/footer.jsp"%>
    <script type="text/javascript">
 	// 保存赞数量
 	function changeLoves(obj){
 		var $obj = $(obj);
 		var timer = null;
		clearTimeout(timer);
		timer = setTimeout(function(){
			var loves = $obj.data("loves");
	 		var id = $obj.data("opid");
	 		loves++;
			var params={loves:loves,id:id};
			$.ajax({
				type:"post",
				url:basePath+"/content/update.do",
				data:params,
				success:function(data){
					if(data == "success"){
						loading("感谢您的点赞。。。",4);
						$(".praise a").text("已赞").removeAttr("onclick");
						if(window.localStorage){
        					localStorage.setItem("zan","已赞");
        				} 
					}else{
						loading("操作失败。。。",4);
					}
				}
			});
		},300);
 	};
 	// 保存收藏数量
 	function changeCollections(obj){
 		var $obj = $(obj);
 		var timer = null;
		clearTimeout(timer);
		timer = setTimeout(function(){
			var collections = $obj.data("collections");
	 		var id = $obj.data("opid");
	 		collections++;
			var params={id:id,collections:collections};
			$.ajax({
				type:"post",
				url:basePath+"/content/update.do",
				data:params,
				success:function(data){
					if(data == "success"){
						loading("感谢您的收藏。。。",4);
						$(".collect_box a").text("已收藏").removeAttr("onclick");
					}else{
						loading("操作失败。。。",4);
					}
				}
			});
		},300);
 	};
    
    // 点击显示表情
 	$(".t_face_btn").click(function(e){
		$(".t_face_con").toggle(500);
		e.stopPropagation();
	}); 
	// 选中QQ表情添加到文本框
	$("#q_ul").find("li").click(function(){
		var img = $(this).find("img").clone();
		$(".t_msg").append(img);
	});
	$(document).click(function(){
		$(".t_face_con").hide(500);
	});
	
	function replay(obj){
		var txt = $(".fbpl").html();
		if(!txt){
			$(".fbpl").append("<div class='t_box'>"+
					"				<div class='t_msg' contenteditable='true' onkeyup='setCacheData(this)'></div> "+
					"				<p class='t_face'>"+
					"					<a href='javascript:void(0);' class='t_face_btn' onclick='showface(this);'>"+
					"						<img src='${basePath}/resources/imgs/face/cza_thumb.gif' alt='表情' width='22' height='22' />"+
					"						<span class='facemotion'>表情</span>"+
					"					</a>"+
					"					<a href='javascript:void(0);' class='t_send_btn' onclick='replayComment(this);'>回 复</a>"+
					"				</p>"+
					"				<div class='t_face_con'>"+
					"					<ul id='q_ul'>"+
					"						<li><img src='${basePath}/resources/imgs/face/zz2_thumb.gif' title='[织]' width='22' height='22'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/horse2_thumb.gif' title='[神马]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/fuyun_thumb.gif' title='[浮云]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/geili_thumb.gif' title='[给力]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/wg_thumb.gif' title='[围观]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/vw_thumb.gif' title='[威武]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/panda_thumb.gif' title='[熊猫]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/rabbit_thumb.gif' title='[兔子]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/otm_thumb.gif' title='[奥特曼]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/j_thumb.gif' title='[囧]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/hufen_thumb.gif' title='[互粉]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/liwu_thumb.gif' title='[礼物]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/smilea_thumb.gif' title='[呵呵]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/tootha_thumb.gif' title='[嘻嘻]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/laugh.gif' title='[哈哈]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/tza_thumb.gif' title='[可爱]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/kl_thumb.gif' title='[可怜]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/kbsa_thumb.gif' title='[挖鼻屎]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cj_thumb.gif' title='[吃惊]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/shamea_thumb.gif' title='[害羞]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/zy_thumb.gif' title='[挤眼]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/bz_thumb.gif' title='[闭嘴]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/bs2_thumb.gif' title='[鄙视]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/lovea_thumb.gif' title='[爱你]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sada_thumb.gif' title='[泪]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/heia_thumb.gif' title='[偷笑]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/qq_thumb.gif' title='[亲亲]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sb_thumb.gif' title='[生病]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/mb_thumb.gif' title='[太开心]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/ldln_thumb.gif' title='[懒得理你]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/yhh_thumb.gif' title='[右哼哼]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/zhh_thumb.gif' title='[左哼哼]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/x_thumb.gif' title='[嘘]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cry.gif' title='[衰]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/wq_thumb.gif' title='[委屈]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/t_thumb.gif' title='[吐]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/k_thumb.gif' title='[打哈气]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/bba_thumb.gif' title='[抱抱]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/angrya_thumb.gif' title='[怒]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/yw_thumb.gif' title='[疑问]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cza_thumb.gif' title='[馋嘴]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/88_thumb.gif' title='[拜拜]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sk_thumb.gif' title='[思考]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sweata_thumb.gif' title='[汗]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sleepya_thumb.gif' title='[困]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sleepa_thumb.gif' title='[睡觉]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/money_thumb.gif' title='[钱]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sw_thumb.gif' title='[失望]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cool_thumb.gif' title='[酷]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/hsa_thumb.gif' title='[花心]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/hatea_thumb.gif' title='[哼]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/gza_thumb.gif' title='[鼓掌]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/dizzya_thumb.gif' title='[晕]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/bs_thumb.gif' title='[悲伤]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/crazya_thumb.gif' title='[抓狂]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/h_thumb.gif' title='[黑线]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/yx_thumb.gif' title='[阴险]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/nm_thumb.gif' title='[怒骂]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/hearta_thumb.gif' title='[心]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/unheart.gif' title='[伤心]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/pig.gif' title='[猪头]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/ok_thumb.gif' title='[ok]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/ye_thumb.gif' title='[耶]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/good_thumb.gif' title='[good]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/no_thumb.gif' title='[不要]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/z2_thumb.gif' title='[赞]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/come_thumb.gif' title='[来]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/sad_thumb.gif' title='[弱]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/lazu_thumb.gif' title='[蜡烛]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/clock_thumb.gif' title='[钟]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cake.gif' title='[蛋糕]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/m_thumb.gif' title='[话筒]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/weijin_thumb.gif' title='[围脖]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/lxhzhuanfa_thumb.gif' title='[转发]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/lxhluguo_thumb.gif' title='[路过这儿]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/bofubianlian_thumb.gif' title='[bofu变脸]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/gbzkun_thumb.gif' title='[gbz困]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/boboshengmenqi_thumb.gif' title='[生闷气]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/chn_buyaoya_thumb.gif' title='[不要啊]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/daxiongleibenxiong_thumb.gif' title='[dx泪奔]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cat_yunqizhong_thumb.gif' title='[运气中]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/youqian_thumb.gif' title='[有钱]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/cf_thumb.gif' title='[冲锋]'></li>"+
					"						<li><img src='${basePath}/resources/imgs/face/camera_thumb.gif' title='[照相机]'></li>"+
					"					</ul>"+
					"				</div>"+
					"			</div>");
			
			$(".fbpl").find(".t_face_btn").click(function(e){
				$(".fbpl .t_face_con").toggle(500);
				e.stopPropagation();
			});
			$(".fbpl #q_ul").find("li").click(function(){
				var img = $(this).find("img").clone();
				$(".fbpl .t_msg").append(img);
			});
		}else{
			$(".fbpl .t_box").slideUp("slow").remove();
		}
	};
	
    </script>
</body>
</html>