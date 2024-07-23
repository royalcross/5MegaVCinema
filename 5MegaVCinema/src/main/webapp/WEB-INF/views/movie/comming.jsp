<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 예정작</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
}

header {
    padding: 10px 0;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

.area {
    margin-bottom: 20px;
}

.area a {
    color: #333;
    text-decoration: none;
    font-size: 18px;
    margin: 0 10px;
    padding: 5px 10px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.area a:hover {
    background-color: #ddd;
}

.section-movie-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    justify-items: center;
    max-width: 1200px;
    margin: 0 auto;
}

.movie-poster {
    width: 250px;
    height: 300px;
    max-width: 100%;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out;
}

.movie-poster:hover {
    transform: scale(1.05);
}

.movie {
    margin-bottom: 20px;
    text-align: center;
    background-color: #fff;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out;
}

.movie:hover {
    transform: translateY(-5px);
}

.title {
    margin-top: 10px;
    font-size: 18px;
    color: #333;
}

.content-link {
    margin-top: 10px;
    font-size: 14px;
    color: blue;
    text-decoration: none;
    cursor: pointer;
    transition: color 0.3s;
}

.content-link:hover {
    color: darkblue;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    getInfo(); 
});

function getInfo() {
    let today = new Date();
    let strDate = "20240705"; // 현재 날짜

//     6개월 후 날짜 계산
    let strSixMonthsLater = formatDate(new Date(today.getFullYear(), today.getMonth() + 3, today.getDate()));


    $.ajax({
        type : "GET",
        url : "https://api.themoviedb.org/3/discover/movie",
        data : {
            api_key: '29a6c0fd07e598399091aed24796eaf2',
            language: 'ko-KR',
            sort_by: 'popularity.desc', // 인기순
            'primary_release_date.gte': strDate, // 오늘
            'primary_release_date.lte': strSixMonthsLater, // 6개월 
            'page': 1 // 첫 번째 페이지 데이터 
        },
        dataType : "json",
        success : function(data) {
            let upcomingMovies = data.results.filter(movie => movie.poster_path !== null); // 포스터 이미지가 있는 영화들만 필터링
            let top10Movies = upcomingMovies.slice(0, 10); // 최근 10개의 영화
            displayUpcomingMovies(top10Movies);
        },
        error : function() {
            alert("영화 데이터를 가져오는 데 실패했습니다.");
        }
    });
}

// TMDB에서 영화 포스터 이미지 가져오기
function getTMDBMoviePoster(movieId, callback) {
    let tmdbApiKey = '29a6c0fd07e598399091aed24796eaf2'; // TMDB API 키
    let searchUrl = 'https://api.themoviedb.org/3/movie/' + movieId;
    let params = {
        api_key: tmdbApiKey,
        language: 'ko-KR' // 한국어로 검색
    };

    $.ajax({
        type: 'GET',
        url: searchUrl,
        data: params,
        dataType: 'json',
        success: function(movieInfo) {
            callback(movieInfo.poster_path); // 포스터 이미지 URL 전달
        },
        error: function(xhr, status, error) {
            console.error('TMDB API 요청 오류:', status, error);
            callback(null); // API 요청 오류 시 null 반환
        }
    });
}

// 날짜 형식을 YYYYMMDD
function formatDate(date) {
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let day = String(date.getDate()).padStart(2, '0');
    return year + '-' + month + '-' + day;
}

// 상영 예정 작 데이터를 화면에 표시
function displayUpcomingMovies(movies) {
    let container = $('#upcomingMoviesContainer');
    container.empty(); // 기존 목록 지우기

    for (let i = 0; i < movies.length; i++) {
        let movie = movies[i];
        let movieId = movie.id;

        // TMDB에서 포스터 이미지 가져오기
        getTMDBMoviePoster(movieId, function(posterPath) {
            if (posterPath) {
                let movieElement = $('<div>').addClass('movie');
                let posterUrl = 'https://image.tmdb.org/t/p/w200' + posterPath; // 포스터 이미지 
                let posterElement = $('<img>').addClass('movie-poster').attr('src', posterUrl).attr('alt', 'Movie Poster');
                let titleElement = $('<div>').addClass('title').text((i + 1) + '. ' + movie.title); // 영화 제목에 순위 추가
                let detailLink = $('<div>').addClass('content-link').text('상세 정보 보기'); // 상세 정보 링크 추가

                // content.jsp로 이동
                detailLink.on('click', function() {
                    window.location.href = '${pageContext.request.contextPath}/Content?movieId=' + movieId;
                });

                // 포스터 이미지와 영화 제목에 순위와 상세 정보 링크 추가
                movieElement.append(posterElement, $('<br>'), titleElement, $('<br>'), detailLink);
                container.append(movieElement);
            }
        });

        // 최대 10개까지만 반복
        if (i >= 9) {
            break;
        }
    }
}
</script>
</head>
<body>
    <header>    
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <h2>상영예정작</h2>
    <div class="area">
        <a href="Boxoffice" >박스오피스</a> | 
        <a href="Comming" >상영예정작</a> 
    </div>
    <div class="section-movie-list" id="upcomingMoviesContainer">
        <!-- 상영 예정작 -->
    </div>
    <footer>       
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>
