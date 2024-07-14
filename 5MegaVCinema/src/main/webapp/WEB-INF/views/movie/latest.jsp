<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근에 나온 영화들</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

/* h2 태그 스타일 */
h2 {
    margin-bottom: 20px;
}

/* 박스오피스 목록을 담을 그리드 스타일 */
.section-movie-list {
    display: grid;
    grid-template-columns: repeat(5, 1fr); /* 한 줄에 5개의 포스터 */
    gap: 20px; /* 포스터 사이의 간격 */
    justify-items: center; /* 가운데 정렬 */
    padding: 20px; /* 여백 추가 */
    max-width: 1200px; /* 최대 너비 제한 */
    margin: 0 auto; /* 가운데 정렬을 위한 자동 마진 */
}

/* 각 포스터 이미지 스타일 */
.movie-poster {
    width: 250px; 
    height: 300px;
    max-width: 100%; 
}

/* 각 포스터에 대한 스타일 */
.movie {
    margin-bottom: 20px; /* 각 포스터 아래 여백 */
    text-align: center; /* 텍스트 가운데 정렬 */
}

/* 영화 제목 스타일 */
.title {
    margin-top: 10px;
    font-size: 16px;
    color: #666;
}

/* 숫자 스타일 */
.rank-number {
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    background-color: #333;
    color: white;
    text-align: center;
    border-radius: 50%;
    margin-right: 5px;
}

/* 링크 스타일 */
.content-link {
    font-size: 14px;
    color: blue;
    text-decoration: underline;
    cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    getInfo(); // 페이지 로드 시 영화 데이터 가져오기
});

function getInfo() {
    // 최근 7일간의 영화 데이터 가져오기
    let today = new Date();
    let strDate = formatDate(today); // 현재 날짜

    // 7일 전 날짜 계산
    let weekAgo = new Date(today);
    weekAgo.setDate(today.getDate() - 7);
    let strWeekAgo = formatDate(weekAgo);

    $.ajax({
        type : "GET",
        url : "https://api.themoviedb.org/3/discover/movie",
        data : {
            api_key: '29a6c0fd07e598399091aed24796eaf2',
            language: 'ko-KR',
            sort_by: 'release_date.desc', // 최신 영화 순으로 정렬
            'primary_release_date.gte': strWeekAgo, // 7일 전 이후
            'primary_release_date.lte': strDate, // 현재 날짜까지
            'page': 1 // 첫 번째 페이지에서만 데이터 가져오기
        },
        dataType : "json",
        success : function(data) {
            let recentMovies = data.results.filter(movie => movie.poster_path !== null); // 포스터 이미지가 있는 영화들만 필터링
            let top10Movies = recentMovies.slice(0, 10); // 최근 10개의 영화만 선택
            displayRecentMovies(top10Movies);
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

// 날짜 형식을 YYYYMMDD로 변환하는 함수
function formatDate(date) {
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let day = String(date.getDate()).padStart(2, '0');
    return year + '-' + month + '-' + day;
}

// 최근 영화 데이터를 화면에 표시
function displayRecentMovies(movies) {
    let container = $('#boxOfficeContainer');
    container.empty(); // 기존 목록 지우기

    for (let i = 0; i < movies.length; i++) {
        let movie = movies[i];
        let movieId = movie.id;

        // TMDB에서 포스터 이미지 가져오기
        getTMDBMoviePoster(movieId, function(posterPath) {
            if (posterPath) {
                let movieElement = $('<div>').addClass('movie');
                let posterUrl = 'https://image.tmdb.org/t/p/w200' + posterPath; // 포스터 이미지 URL 설정 (w200 크기)
                let posterElement = $('<img>').addClass('movie-poster').attr('src', posterUrl).attr('alt', 'Movie Poster');
                let rankNumber = $('<div>').addClass('rank-number').text(i + 1); // 순위 숫자 추가

                let titleElement = $('<div>').addClass('title').text((i + 1) + '. ' + movie.title); // 영화 제목에 순위 추가
                let detailLink = $('<div>').addClass('content-link').text('상세 정보 보기'); // 상세 정보 링크 추가

                // 상세 정보 링크 클릭 시 content.jsp로 이동
                detailLink.on('click', function() {
                    window.location.href = '${pageContext.request.contextPath}/Content?movieId=' + movieId;
                });

                // 포스터 이미지와 영화 제목에 순위와 상세 정보 링크 추가
                movieElement.append(posterElement, titleElement, $('<br>'), detailLink);
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
    <h2>최신개봉작</h2>
    <div class="area">
        <a href="Boxoffice" >박스오피스</a> | 
        <a href="Latest" >최신개봉작</a> | 
        <a href="Comming" >상영예정작</a> 
    </div> 
    <div class="section-movie-list" id="boxOfficeContainer">
        <!-- 최근 영화 목록 -->
    </div>
    <footer>       
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>
