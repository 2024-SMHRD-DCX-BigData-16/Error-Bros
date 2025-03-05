<%@page import="com.errorbros.entity.MemberDTO"%>
<%@page import="com.errorbros.entity.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Search</title>
<style>
.center-container {
	width: 80%;
	max-width: 600px;
	margin: 20px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

#review-wrapper label {
	display: block;
	margin-bottom: 8px;
}

#review-wrapper textarea {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
	resize: vertical;
}

.center-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	flex-grow: 1;
}

.star-rating {
	font-size: 24px;
	color: lightgray;
	cursor: pointer;
	display: flex;
}

.star {
	font-size: 2rem;
	color: lightgray;
	cursor: pointer;
	display: inline-block;
	position: relative;
	width: 30px;
}

.star::before {
	content: '\2605';
	position: absolute;
	left: 0;
	width: 100%;
	overflow: hidden;
	color: lightgray;
}

.star.full::before {
	color: gold;
}

.star.half::before {
	content: '\2605';
	position: absolute;
	width: 50%;
	color: gold;
	overflow: hidden;
}

button[type="submit"] {
	background-color: #e9e9e9;
	color: #000; /* 변경 */
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex;
	justify-content: center;
	align-items: center;
}

button[type="submit"]:hover {
	background-color: #e9e9e9;
}
</style>
</head>

<body>
	<jsp:include page="Head.jsp" />
	

	<% String rest_idx= (String)request.getParameter("rest_idx"); %>
	<div class="center-container">
		<div class="review-wrapper" id="review-wrapper">
			<h2>리뷰 작성</h2>
			<form id="reviewForm" action="insertReview" method="post">
			<input type="hidden" id="rest_idx" name="rest_idx" value="${param.rest_idx }" readonly="readonly">
			<input type="hidden" id="mem_id" name="mem_id" value="${loginMember.mem_id }" readonly="readonly">
				<label for="review_content">리뷰 내용:</label><br>
				<textarea id="review_content" name="review_content" rows="4" cols="50"
					required></textarea>
				<br> <br> <label for="review_ratings">평점:</label>
				<div id="starRating" class="star-rating">
					<span class="star" data-rating="1"></span> <span class="star"
						data-rating="2"></span> <span class="star" data-rating="3"></span>
					<span class="star" data-rating="4"></span> <span class="star"
						data-rating="5"></span>
				</div>
				<br> <input type="hidden" id="review_ratings" name="review_ratings"
					value="0"> <br>
				<button type="submit">리뷰 등록</button>
			</form>
		</div>
	</div>

	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const stars = document.querySelectorAll('#starRating .star');
	    const reviewRatingInput = document.getElementById('review_ratings'); // Hidden input
	    let currentRating = 0;

	    stars.forEach(star => {
	        star.addEventListener('mousemove', (event) => {
	            const rect = star.getBoundingClientRect();
	            const offsetX = event.clientX - rect.left;
	            const width = rect.width;
	            let rating = parseInt(star.dataset.rating);

	            if (offsetX < width / 2) {
	                rating -= 0.5;
	            }

	            highlightStars(rating);
	        });

	        star.addEventListener('click', (event) => {
	            const rect = star.getBoundingClientRect();
	            const offsetX = event.clientX - rect.left;
	            const width = rect.width;
	            let rating = parseInt(star.dataset.rating);

	            if (offsetX < width / 2) {
	                rating -= 0.5;
	            }

	            currentRating = rating;
	            reviewRatingInput.value = rating; // Hidden input에 값 저장
	            highlightStars(rating);
	        });

	        star.addEventListener('mouseleave', () => {
	            highlightStars(currentRating);
	        });
	    });

	    function highlightStars(rating) {
	        const roundedRating = Math.round(rating * 2) / 2; // 0.5 단위 반올림
	        stars.forEach(star => {
	            const starRating = parseInt(star.dataset.rating);
	            star.classList.remove('full', 'half');

	            if (starRating <= roundedRating) {
	                star.classList.add('full');
	            } else if (starRating - 0.5 === roundedRating) {
	                star.classList.add('half');
	            }
	        });

	        // Hidden input 값 업데이트
	        reviewRatingInput.value = roundedRating;
	    }

	    // 기존 값이 있으면 반영
	    if (reviewRatingInput.value > 0) {
	        currentRating = parseFloat(reviewRatingInput.value);
	        highlightStars(currentRating);
	    }
	});


    </script>
</body>

</html>