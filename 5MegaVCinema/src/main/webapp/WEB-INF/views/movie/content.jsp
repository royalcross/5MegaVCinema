<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

/* 상세 정보 */
.movie-details {
    max-width: 800px;
    margin: 0 auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 포스터 */
.poster {
    width: 200px;
    height: 300px;
    display: block;
    margin: 0 auto;
}

/* 제목 */
.movie-title {
    font-size: 24px;
    margin-top: 10px;
}

/* 줄거리 */
.movie-overview {
    margin: 20px 0;
    font-size: 16px;
    color: #333;
}

/* 추가 정보*/
.movie-info {
    font-size: 14px;
    color: #666;
}

/* 뒤로 가기*/
.back-button {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    let movieId = new URLSearchParams(window.location.search).get('movieId');
    if (movieId) {
        getMovieDetails(movieId);
    } else {
        alert("영화 ID가 없음");
    }
});

function getMovieDetails(movieId) {
    let tmdbApiKey = '29a6c0fd07e598399091aed24796eaf2'; // TMDB API 키
    let apiUrl = 'https://api.themoviedb.org/3/movie/${movieId}?api_key=${tmdbApiKey}&language=ko-KR';

    $.ajax({
        type: 'GET',
        url: apiUrl,
        dataType: 'json',
        success: function(data) {
            displayMovieDetails(data);
        },
        error: function(xhr, status, error) {
            console.error('TMDB API 요청 오류:', status, error);
            alert("영화정보 가져오기 실패");
        }
    });
}

function displayMovieDetails(movie) {
    let posterPath = movie.poster_path ? 'https://image.tmdb.org/t/p/w500${movie.poster_path}` : '${pageContext.request.contextPath}/resources/images/default-poster.jpg';
    let releaseDate = movie.release_date || '정보 없음';
    let ageRating = movie.certification || '정보 없음';
    let overview = movie.overview || '정보 없음';

    let credits = movie.credits || {};
    let director = credits.crew ? credits.crew.find(person => person.job === 'Director')?.name || '정보 없음' : '정보 없음';
    let actors = credits.cast ? credits.cast.slice(0, 3).map(actor => actor.name).join(', ') || '정보 없음' : '정보 없음';

    $('#movieDetailsContainer').html(`
        <div class="movie-details">
            <img src="${posterPath}" alt="Movie Poster" class="poster">
            <div class="movie-title">${movie.title}</div>
            <div class="movie-overview">${overview}</div>
            <div class="movie-info">
                <p><strong>개봉일:</strong> ${releaseDate}</p>
                <p><strong>감독:</strong> ${director}</p>
                <p><strong>주연 배우:</strong> ${actors}</p>
                <p><strong>연령 등급:</strong> ${ageRating}</p>
            </div>
            <button class="back-button" onclick="window.history.back();">뒤로 가기</button>
        </div>
    `);
}
</script>
</head>
<body>
    <header>    
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <h2>영화 상세 정보</h2> 
    <div id="movieDetailsContainer">
        <!-- 영화 상세 정보 -->
    </div>
    <footer>       
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>
