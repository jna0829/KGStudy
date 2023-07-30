<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userModify.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/reviewList.css?after">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="modify" id="modify">

		<div class="modify-mg">

			<ul class="modifyList">
				<li class="review_name">
					<h3>리뷰</h3>
				</li>
			</ul>


			<ul class="modifyList">

				<!-- --------------------------------------------------------------------- -->
				<li class="reviewView">
					<!-- 리뷰 통계 -->

					<div class="reviewView-line">

						<div class="star_area">
							<p class="total">
								총 <em>${reviewCnt }
								</em>건
							</p>

							<p class="num">
								<strong>${avgStar} 점</strong>
								<!-- 총점의 평균 점수 -->
							</p>
							<ul class="star_list">
								<li><span class="rating"></span><img
									src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

								<li><span class="rating"></span><img
									src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

								<li><span class="rating"></span><img
									src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

								<li><span class="rating"></span><img
									src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									
								<li><span class="rating" style="width: 80%;"></span><img
									src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							</ul>
						</div>

						<div class="graph_area">
							<ul class="graph_list">
							<fmt:parseNumber var= "star5" integerOnly= "true" value= "${starMap.starCnt5 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star4" integerOnly= "true" value= "${starMap.starCnt4 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star3" integerOnly= "true" value= "${starMap.starCnt3 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star2" integerOnly= "true" value= "${starMap.starCnt2 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star1" integerOnly= "true" value= "${starMap.starCnt1 *100 / reviewCnt}" />
	
								<li><span class="per">${star5}%</span>
									<div class="graph">
										<span class="graph_5"  style="height:${star5}%;"></span>
									</div> <span class="txt">5점</span></li>

								<li><span class="per">${star4}%</span>
									<div class="graph">
										<span class="graph_4"  style="height:${star4}%;"></span>
									</div> <span class="txt">4점</span></li>

								<li><span class="per">${star3}%</span>
									<div class="graph">
										<span class="graph_3"  style="height:${star3}%;"></span>
									</div> <span class="txt">3점</span></li>

								<li><span class="per">${star2}%	</span>
									<div class="graph">
										<span class="graph_2"  style="height:${star2}%;"></span>
									</div> <span class="txt">2점</span></li>

								<li><span class="per">${star1}%</span>
									<div class="graph">
										<span class="graph_1" style="height:${star1}%;"></span>
									</div> <span class="txt">1점</span></li>
							</ul>
						</div>

					</div>

				</li>
				<!-- reviewView end -->
				<!-- --------------------------------------------------------------------- -->

				<!-- --------------------------------------------------------------------- -->
				<li class="reviewViewList">
					<!-- 리뷰 리스트 -->

	<!-- 				<div class="reviewView-sort">
						별점순, 최신순으로 sort
						<div class="align_sort">
							<ul id="gdasSort">
								<li><a href="#">별점순</a></li>
								<li><a href="#">최신순</a></li>
								<li><a>지점검색</a></li>
							</ul>
						</div>
					</div>  -->
					
					
					
					
					
					<!-- 검색 -->
					<div class="reviewView-sort">
						<div>
							<form class="form-inline" action="#" method="post">
								<div class="form-group">
									<select name="type" class="form-control">
										<option value="review_star"
											${Search.type=='review_star' ? 'selected' : ''}>별점순</option>
										<option value="review_date"
											${Search.type=='review_date' ? 'selected' : ''}>최신순</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="keyword"
										value="${Search.keyword}" autocomplete="on" placeholder="지점명을 입력해주세요">
								</div>
								<button type="submit" class="btn btn-success">검색</button>
							</form>
						</div>
					</div>








					<div class="reviewView-line">
						
						<c:forEach var="rvo" items="${Rlist}" varStatus="status" >
						<div class="review_cont review${status.index}">

							<div class="r-area-star">
								<!-- 별점 -->
								<ul class="r-star_list">
									<li><span class="rating" id="star${status.index}-1"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-2"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-3"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-4"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-5"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
								</ul>
							</div>

						
							<div class="r-cont-area">
									<b class="cont-user-id">${rvo.user_id}</b>
									<br>
									<!-- 유저ID -->
									<b class="cont-user-b"><fmt:formatDate value="${rvo.review_date}" pattern="yyyy-MM-dd"/> | </b>
									<b class="cont-user-b">지점명 : ${rvo.store_name}</b>
									<input class="starNum" type="hidden" data-index="${status.index}" value="${rvo.review_star}" >
							</div>

							<div class="r-cont-text">
								${rvo.review_content}
							</div>

							<div class="r-cont-img">
								<ul class="inner">
									<li>
										<a href="#"> 
											<span> 
												<img src="${pageContext.request.contextPath}/resources/img/review_img.jpg" style="width: 165px;">
											</span>
										</a>
									</li>
								</ul>
							</div>

						</div>
						</c:forEach>
					</div>

				</li>
				<!-- reviewView end -->
				<!-- --------------------------------------------------------------------- -->


			</ul>
			<!-- modifyList end -->

		</div>
		<!-- modify-mg div end -->

	</section>

	<%@include file="../include/footer.jsp"%>
	
	<script>
	
		$(".starNum").each(function(i,el) {

			let star = $(el).val();
			let index = $(el).data("index");
			
			starId ="#star"+index+"-";
		
			console.log(star);
			
			for(j=5;j>star;j--){
				
				console.log(starId+j);
				
				$(starId+j).css("width","0%");

			}
			
		})
		
	</script>
	
	
</body>
</html>