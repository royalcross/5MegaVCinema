<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
    .info {
        font-weight: bold;
    }
    .movie-details {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .poster {
        float: left;
        margin-right: 20px;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0,0,0,0.2);
    }
    .movie-info ul li {
        margin-bottom: 10px;
        line-height: 1.6;
    }
    .synopsis {
        margin-top: 20px;
    }
    .synopsis p {
        line-height: 1.6;
    }
</style>
</head>
<body>
<form action="InsertMovie" method="post">
    <header>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <div class="movie-details">
        <div class="movie-info">
            <h3><span class="info">${movie_grade}</span> ${movie.movie_name_kr} (${movie.movie_name_en})</h3>
            <img src="${movie.movie_poster}" alt="포스터" class="poster" />
            <ul>
                <li><span class="info">기본:</span> | ${movie.movie_running_time} 분 | ${movie.movie_genre}</li>
                <li><span class="info">개봉일:</span> ${movie.movie_release_date}</li>
                <li><span class="info">감독:</span> ${movie.movie_director}</li>
                <li><span class="info">배우:</span> ${movie.movie_cast}</li>
                <li><span class="info">등급:</span> ${movie.movie_grade}</li>
            </ul>
            <hr>
        </div>
        <br>
        <div class="synopsis">
            <h4>줄거리</h4>
            <br>
            <p>${movie.movie_content}</p>
            <hr>
            <h3>리뷰</h3>
            <label for="rating">평점:</label>
            <select id="rating" name="rating">
                <option value="5">5 (매우 좋음)</option>
                <option value="4">4 (좋음)</option>
                <option value="3">3 (보통)</option>
                <option value="2">2 (별로)</option>
                <option value="1">1 (매우 별로)</option>
            </select>
            <br>
            <label for="comment">리뷰 내용:</label>
            <input type="text" id="comment" name="comment" size="50">
            <input type="submit" value="리뷰 등록">
            <!-- 리뷰 목록 만들기 -->
        </div>
    </div>
</form>
<footer>
    <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>
