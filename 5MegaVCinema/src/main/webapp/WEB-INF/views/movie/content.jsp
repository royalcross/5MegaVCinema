<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보 페이지</title>
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

/* 영화 상세 정보 스타일 */
.movie-details {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    text-align: left;
}

/* 줄거리 스타일 */
.synopsis {
    margin-top: 20px;
}

/* 리뷰 스타일 */
.review {
    margin-top: 20px;
}

/* 추가 정보 스타일 */
.additional-info {
    margin-top: 20px;
    font-size: 14px;
    color: #666;
}

/* 출연진 스타일 */
.cast {
    margin-top: 10px;
    font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    let movieId = getParameterByName('movieId');
    if (movieId) {
        getTMDBMovieDetails(movieId);
    } else {
        console.error('Movie ID is missing.');
    }
});

// URL에서 파라미터 값 가져오기
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

// TMDB에서 영화 상세 정보 가져오기
function getTMDBMovieDetails(movieId) {
    let tmdbApiKey = '29a6c0fd07e598399091aed24796eaf2'; // TMDB API 키
    let movieUrl = 'https://api.themoviedb.org/3/movie/' + movieId;
    let params = {
        api_key: tmdbApiKey,
        language: 'ko-KR' // 한국어로 검색
    };

    $.ajax({
        type: 'GET',
        url: movieUrl,
        data: params,
        dataType: 'json',
        success: function(movieInfo) {
            displayMovieDetails(movieInfo);
        },
        error: function(xhr, status, error) {
            console.error('TMDB API 요청 오류:', status, error);
        }
    });
}

// 영화 상세 정보 화면에 표시
function displayMovieDetails(movieInfo) {
    let container = $('#movieDetailsContainer');
    container.empty(); // 기존 내용 지우기

    let titleElement = $('<h2>').text(movieInfo.title); // 영화 제목 추가
    let overviewElement = $('<div>').addClass('synopsis').text(movieInfo.overview); // 줄거리 추가
    let releaseDateElement = $('<div>').text('개봉일: ' + movieInfo.release_date); // 개봉일 추가
    let voteAverageElement = $('<div>').text('평균 평점: ' + movieInfo.vote_average); // 평균 평점 추가

    container.append(titleElement, overviewElement, releaseDateElement, voteAverageElement);

    // 추가 정보 표시
    let additionalInfoElement = $('<div>').addClass('additional-info');
    let genres = movieInfo.genres.map(genre => genre.name).join(', ');
    let genresElement = $('<div>').text('장르: ' + genres); // 장르 추가
    let runtimeElement = $('<div>').text('상영 시간: ' + movieInfo.runtime + '분'); // 상영 시간 추가
    let director = movieInfo.credits.crew.find(person => person.job === 'Director');
    let directorElement = $('<div>').text('감독: ' + (director ? director.name : '정보 없음')); // 감독 추가

    let castList = movieInfo.credits.cast.slice(0, 5); // 상위 5명의 출연진만 표시
    let castElement = $('<div>').addClass('cast').text('출연진: ');
    castList.forEach(actor => {
        let actorElement = $('<span>').text(actor.name + ', ');
        castElement.append(actorElement);
    });

    additionalInfoElement.append(genresElement, runtimeElement, directorElement, castElement);
    container.append(additionalInfoElement);
}
</script>
</head>
<body>
    <header>    
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <h2>상세 정보 페이지</h2>
    <div id="movieDetailsContainer">
        <!-- 상세 정보가 여기에 추가됩니다 -->
    </div>
    <footer>       
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>
