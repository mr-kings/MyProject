<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!doctype html>
<html>
 <head>
  <title>king的博客首页</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="Author" content="king">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <%@include file="/WEB-INF/pages/common/common.jsp"%>
  <style type="text/css">
	/*个人信息栏目  start*/
	.person{margin-bottom:30px;margin-top:30px;margin-left:-15px;}
	.person .user{height:100%;margin:0 auto;overflow:hidden;background:#fafafa;}
	/* userbox */
	.person .user .userbox{float:left;}
	.person .user .userbox .u_info{margin-bottom:20px;padding:5px 80px;width:80px;height:80px;display:block;}
	.person .user .userbox .u_info img{width:80px;height:80px;border-radius:50%;vertical-align:middle;}
	.person .user .userbox .name{color:#4c4c4c;font-size:26px;transition:1s;margin-left:68px;text-align:center;display:block;max-width:100px;min-height:30px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;}
	.person .user .userbox .name:hover{color: #828d95;transition:1s;}
	.person .user .userbox a{text-decoration:none;}
	.person .user .userbox .info_list{width:240px;height:48px;margin:15px 0 20px 0;}
 	.person .user .userbox .info_list li{float:left;width:78px;color:#414141;line-height:26px;font-size:16px;text-align:center;}
 	.person .user .userbox .info_list li span{color:#8a8880;line-height:22px;display:block;}
 	/* calebox */
	.person .user .calebox{float:left;}
	.person .user .calebox .caleheader{height:35px;width:100%;background:#fafafa;line-height:35px;color:#4c4c4c;border-bottom:1px solid #eee;position:relative;}
	.person .user .calebox .caleheader #prev,#next{position:absolute;top:0;font-size:30px;cursor:pointer;}
	.person .user .calebox .caleheader #prev:hover{color:#00f;}
	.person .user .calebox .caleheader #next:hover{color:#00f;}
	.person .user .calebox .caleheader #prev{left:2px;}
	.person .user .calebox .caleheader #next{right:2px;}
	.person .user .calebox .caletab{width:100%;border-collapse:collapse;width:100%;}
	.person .user .calebox .caletab thead th{background:#fafafa;color:#4c4c4c}
	.person .user .calebox .caletab th,td{border:1px solid #eee;text-align:center;padding:6px 4px;transition:all 0.3s ease-in-out;}
	.person .user .calebox .caletab td:hover{background:#999;color:#00f;cursor:pointer;transition:all 0.3s ease-in-out;}
	.person .user .calebox .caletab td.noon{color:#999;}
	.person .user .calebox .caletab td.on{color:#fafafa;background:#0066ff;}
	.person .user #time{position:absolute;right:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
	.person .user #cale{position:absolute;left:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
 	/* fansbox */
 	.person .user .fansbox{float:left;}
 	.person .user .fansbox h3{padding:0 15px;line-height:39px;border-bottom:1px solid #eee;margin:0;}
 	.person .user .fansbox h3 span{font-size:14px;color:#414141;}
 	.person .user .fansbox h3 .fans-change{float:right;position:relative;padding-left:10px;color:#8a8880;font-size:12px;transition:1s;}
 	.person .user .fansbox h3 .fans-change i{margin-right:6px;}
 	.person .user .fansbox h3 .fans-change:hover ,i{color:#0066ff;transition:1s;}
 	.person .user .fansbox ul li{margin:30px;width:170px;height:50px;border-bottom:1px solid #eee;}
 	.person .user .fansbox ul li .fans-ava{float:left;position:relative;margin:0px 10px;}
 	.person .user .fansbox ul li .fans-ava img{width:50px;height:50px;border-radius:50%;}
 	.person .user .fansbox a{text-decoration:none;}
	.person .user .fansbox ul li .fans-r{float:right;}
	.person .user .fansbox ul li .fans-r .fans-name{text-align:center;display:block;font-size:12px;line-height:18px;color:#414141;font-weight:bold;width:90px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
	.person .user .fansbox ul li .fans-r .fans-add{cursor:pointer;display:block;margin-top:8px;height:22px;border:1px solid #d8d6d0;text-align:center;line-height:22px;color:#414141;font-size:12px;}
	.person .user .fansbox ul li .fans-r .fans-add:hover{border-color:#414141;}
	/*个人信息栏目  end*/
	
	/* 公告栏   start */
    .soupBox{height:80px;width:670px;overflow:hidden;margin:30px auto;}
	.soupBox .soup{position:relative;float:right;width:auto;height:40px;padding:0 120px 0 20px;background-color:#fff7e7;border-radius:20px;box-shadow:1px 1px 2px rgba(0,0,0,.2);margin-top:36px;}
	.soupBox .soup li i{position:absolute;font-size:28px;color:#eae1d0;cursor:pointer;}
	.soupBox .soup li .txt{display:none;line-height:40px;font-size:14px;color:#6b3612;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:550px;}
	.soupBox .soup li.open .txt{display:block;}
	.soupBox .soup li.open i{color:#e67e22;}
	.soupBox .soup li i.icon-warn{right:80px;top:0;font-size:31px;margin-left:10px;}
	.soupBox .soup li i.icon-iconfontaixin{right:46px;top:0;}
	.soupBox .soup li i.icon-gonggao{right:10px;top:2px;}
	.soupBox span{display:block;background:#fff7e7;float:left;border-radius:10px;line-height:30px;cursor:pointer;font-size:20px;font-weight:600;color:#6b3612;margin-top:5px;padding:5px 8px;}
	.soupBox span .icon-add{font-size:24px;font-weight:600;color:#6b3612;margin-right:5px;}
 	/* 公告栏   end */
	
	/*文本编辑器 start*/
	.editerBox{width:570px;margin:30px auto;display:none;}
	.editerBox .input{width:400px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer{width:570px;height:100%;background:#fff;overflow:hidden;padding:10px;}
	.editerBox .editer .title{width:550px;width:600px;height:30px;margin:10px 0;display:block;font-size:18px;font-weight:600;}
	.editerBox .editer .title input{width:502px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer .upload_pic{position:relative;width:550px;height:320px;border:1px dashed #ccc;text-align:center;margin:20px 0;}
	.editerBox .editer .upload_pic .txt-pic{line-height:320px;font-size:20px;color:#999;font-weight:600;}
	.editerBox .editer .upload_pic .txt-pic #preview{position:absolute;top:0;left:0;}
	.editerBox .editer .upload_pic .txt-pic a{text-decoration: none;}
	.editerBox .editer p{float:left;font-size:14px;font-weight:600;margin:20px 0;}
	.editerBox .editer p .fabiao{height:30px;line-height:30px;}
	.editerBox .editer p .fabiao .submit{padding:0 10px;margin-left:22px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
	.editerBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
	/*文本编辑器 end*/
	
	/* 音乐上传 start */
	.musicUploadBox{width:570px;margin:30px auto;display:none;}
	.musicUploadBox .input{width:474px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.musicUploadBox .editer{width:570px;height:100%;background:#fff;overflow:hidden;padding:10px;}
	.musicUploadBox .editer .upload_pic,.upload_music{position:relative;width:550px;height:320px;border:1px dashed #ccc;text-align:center;margin:20px 0;}
	.musicUploadBox .editer .upload_pic #prograssbar{position:absolute;top:-20px;left:0;height:10px;background:green;width:0%;}
	.musicUploadBox .editer .upload_music{height:80px;}
	.musicUploadBox .editer .upload_pic .m-pic{line-height:320px;font-size:20px;color:#999;font-weight:600;}
	.musicUploadBox .editer .upload_music .m-src{line-height:80px;font-size:20px;color:#999;font-weight:600;}
	.musicUploadBox .editer .upload_pic .m-pic #img{position:absolute;top:0;left:0;}
	.musicUploadBox .editer .upload_pic .m-pic,.m-src a{text-decoration: none;}
	.musicUploadBox .editer p{float:left;font-size:14px;font-weight:600;margin:20px 0;}
	.musicUploadBox .editer p .fabiao{height:30px;line-height:30px;}
	.musicUploadBox .editer p .fabiao .submit{padding:0 10px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
	.musicUploadBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
	/* 音乐上传 end */
	
	/* 文章发表栏  start */
	.fb_box{width:670px;height:110px;overflow:hidden;margin:30px auto;}
 	.fb_box .publicBar{height:100%;background:url("${basePath}/resources/imgs/share/nav224.png")no-repeat;}
 	.fb_box .publicBar li{float:left;width:140px;height:100%;}
 	.fb_box .publicBar li a{width:100%;height:100%;display:block;}
 	.fb_box .publicBar li:hover{background:#e5e5e5;opacity:0.3}
 	.fb_box .publicBar li.user{width:110px;height:100%;position:relative;}
 	.fb_box .publicBar li.user img{width:112px;height:100%;position:absolute;}
 	.fb_box .publicBar li.user:hover{background:transparent;opacity:1;}
	/* 文章发表栏  end */
	
	/* tab切换栏  start */
	.tabBox{padding-left:0;padding-right:30px;}
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
	    width: 100%;
	}
	.tabBox .tab{position:relative;top:30px;color:#7c7c7c;font-size:16px;font-weight:600;}
	.tabBox .tab .active a{background:url(${basePath}/resources/imgs/share/bg2.jpg);}
	.tabBox .row .panel{padding:0;}
	.tabBox .row .panel .panel-body{padding:0;border:2px solid transparent;transition:all 1s;}
	.tabBox .row .panel .panel-body:hover{border:2px solid #3498db;transition:all 1s;}
	.tabBox .row .panel .pic{padding:0;height:120px;}
	.tabBox .row .panel .pic img{height:120px;width:100%;}
	.tabBox .list:nth-child(4n+1){position:relative;}
	.tabBox .list:hover .shade{opacity:1;}
	.tabBox .list:hover .cover .img{transform:scale(1.1);}
	.tabBox .list .shade{box-shadow:0 0 12px rgba(0, 0, 0, 0.1);position:absolute;left:0;top:0;width:100%;height:100%;background:#fff;z-index:1;opacity:0;}
	.tabBox .list .cover{overflow:hidden;position:relative;z-index:2;margin-top:15px;}
	.tabBox .list .info{position:relative;z-index:2;border-bottom:1px solid #e2e8eb;padding:5px 0 20px 0;}
	.tabBox .list .info .msg{overflow: hidden;}
	.tabBox .list .info .msg span{margin-right:10px;}
	.tabBox .list .info .msg span i{margin-right:3px;color:#9aabb8;font-weight:600;}
	.tabBox .list .info .user{margin-top:7px;}
	.tabBox .list .info .user a{display:block;height:20px;line-height: 20px;color:#2c3e50;}
	.tabBox .list .info .title{font-weight:bold;color:#34495e;margin-bottom:5px;}
	.tabBox .list .info .msg span em {font-size:14px;color:#9aabb8;display:inline-block;line-height:21px;vertical-align: middle;}
	.tabBox .list .info .user a .headerPic{float:left;width:20px;height:20px;border-radius:50%;}
	.tabBox .list .info .user a .name{float:left;margin-left:10px;font-size:12px;}
	.tzPage{font-size:14px;margin-top:0px;float:right;margin-left: 0px;}
	.ellipsis{width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
	.row{margin:0;}
	.iconfont{margin-right:6px;color:#9aabb8;font-weight:600;font-size: 18px;}
	.data{position:absolute;right:10px;top:5px;color: #bdbdbd;}
	h4 .tag{float:left;height:25px;margin:1px 5px 1px 0;	padding: 0 10px;font-size: 12px;color: #fff;border-radius: 2px;line-height: 25px;}
	h4 a{text-decoration:none;}
	h4 .title{line-height:28px;display: block;max-width: 450px;font-size: 18px;color: #2c3e50;font-weight: normal;}
	.bg-blue {background-color: #3498db!important;color: #fff !important;}
	.mt10{margin-top: 10px !important;}
	.container .panel .row p{max-height:44px;overflow: hidden;margin-top:10px;color: #7f8c8d;}
	.msg span{margin-right:10px;}
	.msg span em {font-size:14px;color:#9aabb8;}
	.tab-pane{margin-top: 60px;}
	/* tab切换栏 end */
	
  </style>
  <link rel="stylesheet" type="text/css" href="${basePath}/resources/js/umeditor/themes/default/css/umeditor.css">
  <script type="text/javascript" src="${basePath}/resources/js/king_upload.js"></script>
  <script type="text/javascript" src="${basePath}/resources/js/wnl/wnl.js"></script>
  <script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.js"></script>
 </head>
 
 <body data-count="${itemCount}">
 <%@include file="/WEB-INF/pages/common/header.jsp"%>
 <%@include file="/WEB-INF/pages/common/left.jsp"%>

 	<div class="container">
		<!--start Carousel -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class=""></li>
				<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="2" class=""></li>
				<li data-target="#myCarousel" data-slide-to="3" class=""></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item ">
					<img src="${basePath}/resources/imgs/banner/banner1.jpeg" alt="First slide" width="1200">
				</div>
				<div class="item active">
					<img src="${basePath}/resources/imgs/banner/banner2.jpeg" alt="Second slide" width="1200">
				</div>
				<div class="item">
					<img src="${basePath}/resources/imgs/banner/banner3.jpeg" alt="Third slide" width="1200">
				</div>
				<div class="item">
					<img src="${basePath}/resources/imgs/banner/banner4.png" alt="Four slide" width="1200">
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		<!-- end carousel -->
		
		 <!--个人信息 start-->
		 <div class="person container">
		 	<div class="user row">
		 		<!-- userbox -->
		 		<div class="userbox col-md-3">
					<span class="u_info">
						<a href="${basePath}/user/toPerson.do">
							<img src=${basePath}${sessionScope.userHeaderPic} alt="头像">
						</a>
					</span>
					<a href="${basePath}/user/toPerson.do" class="name"><%=request.getSession().getAttribute("userName") %></a>
					<ul class="info_list">
						<li>
							<a href="javascript:void(0);">
								<strong class="dynamic_count">1</strong>
								<span>作品</span>
							</a>
						</li>
						<li style="border-left:1px solid #d8d6d0;border-right: 1px solid #d8d6d0;">
							<a href="${basePath}/fan/list.do">
								<strong class="follow_count">4</strong>
								<span>关注</span>
							</a>
						</li>
						<li>
							<a href="${basePath}/fan/list.do">
								<strong class="fans_count">10</strong>
								<span>粉丝</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- calebox -->
				<div class="calebox col-md-6">
					<div class="caleheader col-md-12">
						<span id="prev">&lt;</span>
						<span id="cale">
							<span id="y"></span>
							<span id="m"></span>
						</span>
						<span id="time"></span>
						<span id="next">&gt;</span>
					</div>
					<table class="caletab col-md-12">
						<thead id="theadweek"></thead>
						<tbody id="tbodybox"></tbody>
					</table>
				</div>
				<!-- fansbox -->
				<div class="fansbox col-md-3">
				    <h3>
					    <span>可能感兴趣的人</span>
					    <a href="javascript:void(0);" class="fans-change" onclick="hyb(this);"><i class="iconfont icon-shuanxin"></i>换一批</a>
				    </h3>
					<ul class="f-list">
					    <c:forEach items="${users}" var="user">
					    	 <li>
								<a class="fans-ava" target="_blank">
									<img src="${basePath}${user.headerPic}">
								</a>
								<div class="fans-r">
									<a class="fans-name" data-uname="${user.userName}">${user.userName}</a>
									<a class="fans-add" onclick="saveFan(this);" data-uid="${user.userId}">+ 关注</a>
								</div>
							 </li>
					    </c:forEach>
					</ul>
				</div>
			</div>
		 </div>
		 <!--个人信息 end-->
		
		 <!-- 公告栏  start -->
		 <div class="soupBox">
			<ul class="soup">
			 	<li class="">
				 	<i class="iconfont icon-warn" title="更新"></i>
				 	<a class="txt" href="" target="_blank"> 更新：上传作品明细增添字体设计一栏！欢迎大家上传~ </a>
			 	</li>
			 	<li class="">
				 	<i class="iconfont icon-iconfontaixin" title="鸡汤"></i>
				 	<a class="txt" href="" target="_blank"> 鸡汤：将来的你一定会感谢现在努力拼命的自己~ </a>
			 	</li>
			 	<li class="open">
				 	<i class="iconfont icon-gonggao" title="公告"></i>
				 	<a class="txt" href="" target="_blank"> 公告：king将从0点至明早7点进行数据库优化，平台将无法访问，造成不便敬请谅解！ </a>
			 	</li>
		 	</ul> 
		</div>
		 <!-- 公告栏  end -->
		
		 <!-- 发表文章栏目   start -->
		 <div class="fb_box">
		 	<ul class="publicBar">
			 	<li class="user">
				 	<a href="${basePath}/user/toPerson.do" target="_blank">
				 		<img src="${basePath}${sessionScope.userHeaderPic}" alt="头像">
				 	</a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_aritcle"></a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_pic"></a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_music"></a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_video"></a>
			 	</li>
		 	</ul>
		 </div>
		 <!-- 发表文章栏目  end -->
		 
		 <!--文本编辑器 start-->
		 <div class="editerBox">
		 	<div class="editer">
		 		<span class="title">
		 			标题:
		 			<input type="text" placeholder="请输入标题不得超过50个字" maxlength="50" class="txt_title">
		 		</span>
		 		<span class="description title">
		 			描述:
		 			<input type="text" placeholder="描述不得超过200个字" maxlength="200" class="txt_description">
		 		</span>
		 		<div class="upload_pic">
		 			<!-- <input type="file" id="file" onchange="uploadContentImg(this)" style="display:none;"> -->
		 			<span class="txt-pic">
		 				<a href="javascript:void(0);" onclick="openBrowse(this,'#preview')">请添加封面图片</a>
		 				<img id="preview" src="" data-dir="imgs/contentImg" width="548" height="318" style="display:none;">
		 			</span>
		 		</div>
				<script id="myEditor" type="text/plain" style="width:550px;height:300px;margin:10px 0;overflow-X:hidden;overflow-Y:auto;"></script>
		 		<p>
					标签：
					<input type="text" class="input" placeholder="请输入标签" maxlength="40">	
					<span class="fabiao">
						<input type="button" class="submit" value="发表文章" onclick="saveContent(this);">
					</span>
		 		</p>
		 	</div>
		 </div>
		 <!--文本编辑器 end-->
		 
		 <!--音乐上传 -->
		 <div class="musicUploadBox">
		 	<div class="editer">
		 		<div class="upload_pic">
		 			<input type="file" id="file" onchange="uploadFile()" style="display:none;">
		 			<span class="m-pic">
		 				<a href="javascript:void(0);" onclick="openBrowse(this,'#img')">请添加封面图片</a>
		 				<img id="img" src="" data-img="" width="548" data-dir="mp3/img" height="318" style="display:none;">
		 			</span>
		 			<!-- <span id="prograssbar"></span> -->
		 		</div>
		 		
		 		<div class="upload_music">
		 			<input type="file" id="file" accept="image/jpg,image/jpeg,image/png,image/gif,audio/mp3" onchange="uploadFile()" style="display:none;">
		 			<span class="m-src">
		 				<a href="javascript:void(0);" onclick="openBrowse(this,'#audio')">请添加音乐</a>
		 				<audio id="audio" src="" data-link="" data-dir="mp3/song"></audio>
		 			</span>
		 		</div>
		 		
		 		<p>
		 			音乐描述：
		 			<input type="text" class="input m_description" placeholder="描述不得超过500个字" maxlength="500">
		 		</p>
		 		
		 		<p>
					音乐标题：
					<input type="text" class="input m_title" readonly="readonly" placeholder="音乐标题">	
		 		</p>
		 		
		 		<p>
					演唱歌手：
					<input type="text" class="input m_singer" readonly="readonly" placeholder="演唱歌手">	
		 		</p>
		 		
		 		<p>
					音乐大小：
					<input type="text" class="input m_size" readonly="readonly" placeholder="音乐文件大小">	
		 		</p>
		 		
		 		<p>
					播放时长：
					<input type="text" class="input m_time" readonly="readonly" placeholder="音乐播放时长">	
		 		</p>
		 		
		 		<p>
					音乐类型：
					<select class="input m_category">
						<option value="">--请选择--</option>
						<option value="1">流行</option>
						<option value="2">摇滚</option>
						<option value="3">民谣</option>
						<option value="4">名族风</option>
						<option value="5">重金属</option>
						<option value="6">轻音乐</option>
						<option value="7">黑暗</option>
						<option value="8">爵士</option>
						<option value="9">乡村</option>
						<option value="10">古典</option>
						<option value="11">拉丁</option>
						<option value="12">儿童</option>
						<option value="13">迷幻</option>
					</select>	
		 		</p>
		 		
		 		<p style="text-align:center;float: none;">
		 			<span class="fabiao">
						<input type="button" class="submit" value="保存音乐" onclick="saveMusic(this);">
					</span>
		 		</p>
		 	</div>
		 </div>
		 <!--音乐上传 end-->

		<!-- list start-->
		<div class="container tabBox">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs tab" role="tablist">
				<li role="presentation" id="music" class="active" onclick="changeTab(this);" data-model="music" data-count="${itemCount}">
					<a href="#music" aria-controls="music" role="tab" data-toggle="tab">音乐</a>
				</li>
				<li role="presentation" id="content" onclick="changeTab(this);" data-model="content" data-count="${count}">
					<a href="#aritcle" aria-controls="aritcle" role="tab" data-toggle="tab">文章</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 音乐栏 -->
				<div role="tabpanel" class="tab-pane fade in active" id="music">
					<!-- 音乐列表 -->
					<div class="row musicRow contList"></div>
				</div>
				<!-- 文章栏 -->
				<div role="tabpanel" class="tab-pane fade in" id="aritcle">
					<!-- 文章列表 -->
					<div class="row aritcleRow contList"></div>
				</div>
			</div>
			<!-- 分页 -->
			<div class="col-md-8 cpage" style="margin-top:30px;"></div>
		</div>
		<!--list end-->
		<%@include file="/WEB-INF/pages/common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function(){
			//加载banner
			//loadBanner();
			$(".tmui-tips").tmTip();
			/* 初始化音乐列表栏 */
			var itemCount = $("body").data("count");
			kingIndex.initPage(itemCount);
			kingIndex.loadData(0,12);
			/*初始化万年历 */
			initWnl();
		});
		
		//加载banner
		/* function loadBanner(){
			var timer = null;
			clearTimeout(timer);
			timer = setTimeout(function(){
				$.ajax({
					type:"post",
					url:basePath+"/banner/template.do",
					success:function(data){
						alert(data);
						var $data = $(data);
						$(".carousel-inner").html($data);
					}
				});
			},300);
		} */
		
		//粉丝关注列表分页
		function hyb(obj){
			var pageNo = 0;
			var pageSize = 2;
			pageNo++;
			var mark = true;
			var timer = null;
			clearTimeout(timer);
			timer = setTimeout(function(){
				if(!mark)return;
				var params={pageNo:pageNo*pageSize,pageSize:pageSize};
				$.ajax({
					type:"post",
					url:basePath+"/user/template.do",
					beforeSend:function(){loading2($(".f-list"),4);},
					data:params,
					success:function(data){
						var count = $(data).find("#itemCount").val()-1;
						if(data && count%2 > 0){
							var $data = $(data);
							$(".f-list").html($data);
						}else{
							loading("数据加载完毕",4);
							$(obj).removeAttr("onclick");
							$(".f-list").html("");
							mark = false;
						}
					}
				});
			},300);
		};
	 	// 粉丝保存关注
	 	function saveFan(obj){
	 		var $obj = $(obj);
	 		var userName = $obj.prev().data("uname");
	 		var userId = $obj.data("uid");
	 		if(!userName || !userId)return;
	 		var params = {userName:userName,userId:userId};
	 		alert(JSON.stringify(params));
	 		$.ajax({
	 			type:"post",
	 			url:basePath+"/fan/save.do",
	 			data:params,
	 			success:function(data){
	 				var data = data.trim();
	 				if(data=="success"){
	 					loading("关注成功...",4);
	 					$obj.parent().parent().fadeOut("slow",function(){$obj.remove();})
	 				}else if(data=="fail" || data=="error"){
	 					loading("关注失败...",4);
	 				}
	 			}
	 		});
	 	}
		
		// 音乐文章菜单切换
		function changeTab(obj){
			//$.tzConfirm({title:"友情提示",content:"您确定删除吗?"});
			var $obj = $(obj);
			var model = $obj.data("model");
			var itemCount = $obj.data("count");
			if(isNotEmpty(model)){
				if(window.localStorage){
					localStorage.setItem("model", model);
				}
			}
			kingIndex.initPage(itemCount);
			kingIndex.loadData(0,12,function(itemCount){
				kingIndex.initPage(itemCount);
			});
		};
		function loading2(target,mark){
			$.loading({target:$(target),mark:1}); 
		};
		var kingIndex = {
			timer :null,
			initPage:function(itemCount){
				$(".cpage").tzPage(itemCount, {
					num_edge_entries : 1, //边缘页数
					num_display_entries :4, //主体页数
					num_edge_entries:5,
					current_page:0,
					showGo:true,
					showSelect:false,
					items_per_page : 12, //每页显示X项
					prev_text : "前一页",
					next_text : "后一页",
					callback : function(pageNo,psize){//回调函数
						kingIndex.loadData(pageNo,psize);
					}
				});
			},
			loadData:function(pageNo,pageSize,callback){
				if(window.localStorage){
					var model = localStorage.getItem("model");
				}
				clearTimeout(this.timer);
				this.timer = setTimeout(function(){
					$.ajax({
						type:"post",
						beforeSend:function(){loading2($(".contList"),4);},
						url:basePath+"/"+model+"/template.do",
						data:{pageNo:pageNo*pageSize,pageSize:pageSize},
						success:function(data){
							var $data = $(data);
							$(".contList").html($data);
							$(".tmui-tips").tmTip();
							var itemCount = $data.find("#itemCount").val();
							if(callback)callback(itemCount);
						}
					});
				},300);
			}	
		}
		
    /*格式化时间*/
	function timeFormate(time){
		return time<10 ? "0" + time:time;
	};
	//保存点击数
	function changeHits(obj){
		var $obj = $(obj);
		var timer = null;
		clearTimeout(timer);
		timer = setTimeout(function(){
			var model = $obj.data("model");
			var hits = $obj.data("hits");
			var id = $obj.data("opid");
			hits++;
			var params={hits:hits,id:id};
			$.ajax({
				type:"post",
				url:basePath+"/"+model+"/update.do",
				data:params,
				success:function(data){
					if(data == "success"){
						loading("数据加载中请稍等。。。",4);
						window.open(basePath+"/"+model+"/detail/"+id+".do");
					}else{
						loading("操作失败。。。",4);
					}
				}
			});
		},300);
	};
	
	//实例化编辑器
	var um = UM.getEditor("myEditor");
	
	//获得整个html的内容
	function getAllHtml(myEditor){
        return UM.getEditor(myEditor).getAllHtml();
    }
	
	//获取富文本编辑器的带有格式的文本
	function getPlainTxt(myEditor){
		return UM.getEditor(myEditor).getPlainTxt();
	}
	
	//获取富文本编辑器的纯文本内容
	function getEditText(myEditor){
		return UM.getEditor(myEditor).getContentTxt();
	}
	//给某个富文本框赋值
	function setEditorText(message,myEditor){
		 UM.getEditor(myEditor).setContent(message, false);//清空富文本编辑器
	}
	
	 /* 发表文章栏目  */
	 $(".fb_aritcle").click(function(){
		 $(".musicUploadBox").slideUp();
		 $(".editerBox").slideToggle();
	 });
	 /* 发表音乐栏目  */
	 $(".fb_music").click(function(){
		 $(".editerBox").slideUp();
		 $(".musicUploadBox").slideToggle();
	 });
	 /* 公告栏触发事件  */
	 $(".soup li").click(function(){
		 $(this).addClass("open").siblings().removeClass("open");
	 });
	 
	/*发表文章*/
	function saveContent(obj){
		var titleVal = $(".txt_title").val();
		var description = $(".txt_description").val();
		var img = $(".txt-pic img").attr("src");
		var contentVal = getPlainTxt("myEditor");
		var tagval = $("p .input").val();
		
		if(!titleVal || !description || !img || !contentVal || !tagval){
			loading("请填写完整内容",4);
			return false;
		}
		var params = {title:titleVal,description:description,image:img,content:contentVal,tag:tagval};
		$.ajax({
			type:"post",
			url:basePath+"/content/save.do",
			data:params,
			beforeSend:function(){loading("文章发表中请等待...",5);},
			success:function(data){
				var data = data.trim();
				if(data == "fail" || data=="error"){
					loading("文章发表失败...",5);
				}
				if(data == "success"){
					loading("文章发表成功...",5);
					location.reload();
					$(".editerBox").slideUp();
					$(".nav-tabs #content").trigger("click");
				}
			}
		}); 
	};
	
	// 音乐上传成功的回调函数
	var audioDom = document.getElementById("audio");
	function uploadsuccess(dom,jdata){
		if(jdata.target=="#img"){
			$(jdata.target).css("display","block").data("img",jdata.url).attr("src",basePath+jdata.url);
		}else if(jdata.target=="#preview"){
			$(jdata.target).css("display","block").attr("src",basePath+jdata.url);
		}else if(jdata.target=="#audio"){
			$(jdata.target).attr("src",basePath+jdata.url).data("link",jdata.url);
			$(jdata.target).attr("controls","controls").prev().hide();
			var name = jdata.name;
			var title = name.split("-")[1].trim().split(".")[0];
			var singer = name.split("-")[0];
			$(".m_size").val(jdata.size);
			$(".m_title").val(title);
			$(".m_singer").val(singer);
			
			audioDom.oncanplaythrough = function(){
				var time = this.duration;
				var m = Math.floor(time / 60) ;
				var s = Math.floor(time % 60);
				if(m<10) m = "0"+m;
				if(s<10) s = "0"+s;
				$(".m_time").val(m+":"+s);
			};
		}
	}
	/*发表音乐*/
	function saveMusic(obj){ //http://localhost:8080/MyBoke
		var img = $("#img").attr("src").substring(28);
		var src = $("#audio").attr("src").substring(28);
		var title = $(".m_title").val();
		var description = $(".m_description").val();
		var singer = $(".m_singer").val();
		var size = $(".m_size").val();
		var time = $(".m_time").val();
		var category_id = $(".m_category").val();
		
		if(!title || !description || !img || !category_id || !src || !singer || !size || !time){
			loading("请填写完整内容",4);
			return false;
		}
		var params = {title:title,description:description,img:img,categoryId:category_id,src:src,singer:singer,size:size,time:time};
		//alert(JSON.stringify(params));
		//return;
		$.ajax({
			type:"post",
			url:basePath+"/music/save.do",
			data:params,
			beforeSend:function(){loading("音乐发表中请等待...",5);},
			success:function(data){
				var data = data.trim();
				if(data == "fail" || data=="error"){
					loading("音乐发表失败...",5);
				}
				if(data == "success"){
					loading("音乐发表成功...",5);
					location.reload();
					$(".musicUploadBox").slideUp();
					$(".nav-tabs #music").trigger("click");
				}
			}
		}); 
	};
 </script>
 </body>
</html>

