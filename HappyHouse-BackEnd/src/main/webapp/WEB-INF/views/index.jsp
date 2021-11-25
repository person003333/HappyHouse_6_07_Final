<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.html"%>

</head>
<body>
<%@ include file="/include/navbar.jsp"%>

<!-- Page Header -->
    <header class="masthead" style=" margin-bottom: 0px; background-image: url('/img/home-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>HAPPY HOUSE</h1>
                        <span class="subheading">행복한 우리 집</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

<!-- Main Content -->
<section id="index_section" >
			<div class="card col-sm-12 mt-1" style="min-height: 850px;" >
				<div style="text-align: center">
					시도 : 
					<select id="sido">
						<option value="0">선택</option>
					</select>
					구군 : 
					<select id="gugun">
						<option value="0">선택</option>
					</select>
					읍면동 : 
					<select id="dong">
						<option value="0">선택</option>
					</select>
					<button type="button" id="aptSearchBtn">검색</button>
				<span id="list_info" style="display:none;"><a href='javascript:uncallHouseInfo();'>목록제거</a></span>
				</div>
				<div>
				<div class="container">
					<div class="row">
						<div class="col-4" id="apt_info" style="display:none;">
							<div class="details-text" id="details-text">
								<a style="margin: 2px;" href="detailsApt.html">선택된 동이 없습니다.</a>
								<p class="important" style="margin: 0;">거래금액: </p>
								<p class="important" style="margin: 0;">건축연도:</p>
								<p style="margin: 0;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-calendar-date"
										viewBox="0 0 16 16">
                            				<path
											d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z" />
                            				<path
											d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                        				</svg>
									2019. 12. 16
								</p>
								<hr>
							</div>
						</div>
						<div class="col-4" id="apt_detailinfo" style="display:none;">
							<div class="details_deal-text" id="details_deal-text">
								<a style="margin: 2px;" href="detailsApt.html">선택된 동이 없습니다.</a>
								<p class="important" style="margin: 0;">거래금액: </p>
								<p class="important" style="margin: 0;">건축연도:</p>
								<p style="margin: 0;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-calendar-date"
										viewBox="0 0 16 16">
                            				<path
											d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z" />
                            				<path
											d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                        				</svg>
									2019. 12. 16
								</p>
								<hr>
							</div>
						</div>
						<div class="col-12" id="map_info">
							<div class="map_wrap">
								<div id="map" style="width:100%;height:800px;"></div>
							
								<ul id="category">
        							<li id="BK9" data-order="0"> 
        								<span class="category_bg bank"></span>
        								은행
        							</li>       
							        <li id="MT1" data-order="1"> 
							            <span class="category_bg mart"></span>
							           	마트
							        </li>  
							        <li id="PM9" data-order="2"> 
							            <span class="category_bg pharmacy"></span>
							            	약국
							        </li>  
							        <li id="SW8" data-order="3"> 
							            <span class="category_bg oil"></span>
							            	지하철역
							        </li>  
							        <li id="CE7" data-order="4"> 
							            <span class="category_bg cafe"></span>
							            	카페
							        </li>  
							        <li id="CS2" data-order="5"> 
							            <span class="category_bg store"></span>
							            	편의점
							        </li>      
							    </ul>
							   </div>
						</div>
					</div>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3aaf60605453ed45190d13a96cbe80eb&libraries=services"></script>
				<script type="text/javascript" src="js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){					
					$.get(root + "/map/sido"
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});
						}
						, "json"
					);
				});
				$(document).on("change", "#sido", function() {
					$.get(root + "/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get(root + "/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get(root + "/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								displayMarkers(data);
								console.log(data);
								console.log($("#apt_detailinfo").css('display'));
								$(".details-text").empty();
								if(($("#apt_detailinfo").css('display')=='block')){
									callHouseInfo();
								}
								$.each(data, function(index, vo) {
									var a = document.createElement("a");
									
									let a_str =(index+1)+". "+ vo.aptName;
									a.append(a_str);
									a.addEventListener("click", function(){
										callHouseDealInfo(vo.aptCode);
									});
									$(".details-text").append(a);
									let str = "<ul class="+colorArr[index%3]+">"
									+ "<li> 거래금액 : " + vo.recentPrice + "</li>"
									+ "<li class='important'> 건축연도 : " 
									+ "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-calendar-date' viewBox='0 0 16 16'> "+
				                    + "<path d='M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z' />"
				                    + "<path d='M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z' /> "
				                	+ "</svg> " + vo.buildYear + "</li><hr>";
									$(".details-text").append(str);
								});//each
							}
							, "json"
					);
				});
				
				$(document).on("click", "#aptSearchBtn", function() {
					$("#map_info").removeClass("col-12");
					$("#map_info").addClass("col-8");
					callHouseInfo();
					$("#apt_info").addClass("col-4");
					
				});
				
				</script>
				</div>
				</div>
			</div>
		</section>
		
<%@ include file="/include/footer.jsp"%>		
</body>

</html>