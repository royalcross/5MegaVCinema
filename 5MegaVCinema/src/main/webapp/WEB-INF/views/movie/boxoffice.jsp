<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박스오피스</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

h2 {
    margin-bottom: 20px;
    font-size: 28px;
    color: #333;
}

.area {
    font-size: 18px;
    margin-bottom: 20px;
}

.area a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
    margin: 0 10px;
}

.area a:hover {
    text-decoration: underline;
}

.section-movie-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
    justify-items: center;
    max-width: 1200px;
    margin: 0 auto;
}

.movie {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease-in-out;
    padding: 10px;
    text-align: center;
}

.movie:hover {
    transform: scale(1.05);
}

.movie-poster {
    width: 100%;
    height: auto;
    border-bottom: 1px solid #ddd;
}

.title {
    margin-top: 10px;
    font-size: 18px;
    color: #333;
}

.content-link {
    margin-top: 10px;
    font-size: 14px;
    color: #007bff;
    text-decoration: none;
    cursor: pointer;
}

.content-link:hover {
    text-decoration: underline;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    getBoxOfficeInfo(); // 페이지 로드 시 영화 데이터 가져오기
});

function getBoxOfficeInfo() {
    let strDate = "20240705"; // 2024년 7월 5일

    $.ajax({
        type: "GET",
        url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=6df3762809d565def9296e249c961879&targetDt=" + strDate,
        dataType: "json",
        success: function(data) {
            let dailyBoxOfficeList = data.boxOfficeResult.dailyBoxOfficeList;
            let top10Movies = dailyBoxOfficeList.slice(0, 10); // 상위 10개 영화 가져오기
            displayBoxOfficeData(top10Movies);
        },
        error: function() {
            alert("박스오피스 데이터를 가져오는 데 실패했습니다.");
        }
    });
}

function displayBoxOfficeData(movies) {
    let container = $('#boxOfficeContainer');
    container.empty(); // 기존 목록 지우기

    for (let i = 0; i < movies.length; i++) {
        let movie = movies[i];
        let movieNm = movie.movieNm;
        let movieId = movie.movieCd;

        getMoviePoster(movieNm, function(posterPath) {
            let movieElement = $('<div>').addClass('movie');
            let titleElement = $('<div>').addClass('title').text((i + 1) + '. ' + movieNm); // 영화 제목에 순위 추가

            let posterUrl = posterPath ? 'https://image.tmdb.org/t/p/w200' + posterPath : '${pageContext.request.contextPath}/resources/images/default-poster.jpg';
            let posterElement = $('<img>').addClass('movie-poster').attr('src', posterUrl).attr('alt', 'Movie Poster');
            let detailLink = createDetailLink(movieId);

            movieElement.append(posterElement, $('<br>'), titleElement, $('<br>'), detailLink);
            container.append(movieElement);
        });
    }
}

function getMoviePoster(movieNm, callback) {
    let tmdbApiKey = '29a6c0fd07e598399091aed24796eaf2'; // TMDB API 키
    let searchUrl = 'https://api.themoviedb.org/3/search/movie';
    let params = {
        api_key: tmdbApiKey,
        query: movieNm,
        language: 'ko-KR'
    };

    $.ajax({
        type: 'GET',
        url: searchUrl,
        data: params,
        dataType: 'json',
        success: function(response) {
            if (response.results && response.results.length > 0) {
                let movieInfo = response.results[0];
                callback(movieInfo.poster_path);
            } else {
                console.error('No movie found for the given title:', movieNm);
                callback(null);
            }
        },
        error: function(xhr, status, error) {
            console.error('TMDB API 요청 오류:', status, error);
            callback(null);
        }
    });
}

function createDetailLink(movieId) {
    let detailLink = $('<div>').addClass('content-link').text('상세 정보 보기');
    detailLink.on('click', function() {
        // 상세 정보를 가져오는 페이지로 이동
        window.location.href = '${pageContext.request.contextPath}/Content?movieId=' + movieId;  
    });
    return detailLink;
}
</script>
</head>
<body>
    <header>    
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <h2>박스오피스</h2> 
    <div class="area">
        <a href="Boxoffice" >박스오피스</a> | 
        <a href="Comming" >상영예정작</a> 
    </div> 
    <br>
    <div class="section-movie-list" id="boxOfficeContainer">
        <!-- 박스오피스 목록 -->
    </div>
    <footer>       
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>

