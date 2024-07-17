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
    background-color: #f5f5f5;
    color: #333;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    color: #333;
    margin-top: 20px;
}

.movie-details {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: left; /* 왼쪽 정렬 */
}

.movie-poster {
    display: block;
    margin: 0 auto; /* 가운데 정렬 */
    width: 300px;
    height: 450px;
    object-fit: cover;
    border-radius: 8px;
}

.movie-info {
    margin-top: 20px;
}

.movie-info dl {
    margin: 0;
    padding: 0;
    border-top: 1px solid #ddd;
}

.movie-info dt {
    font-weight: bold;
    margin: 10px 0 5px;
}

.movie-info dd {
    margin: 0 0 10px;
}

.back-link {
    margin-top: 20px;
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}

.back-link:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
    <header>    
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <h2>영화 상세 정보</h2> 
    <div class="movie-details">
        <c:choose>
            <c:when test="${param.movieId == '20235974'}">
                <c:set var="movieTitle" value="인사이드아웃2"/>
				<c:set var="movieGenres" value="애니메이션"/>
				<c:set var="movieDirector" value="켈시 만"/>
				<c:set var="movieRelease" value="24.06.12"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="96분"/>
                <c:set var="movieCast" value="에이미 포엘러 | 토니 헤일"/>
                <c:set var="movieRating" value="전체 관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20235974&size=210"/>
                <c:set var="movieSynopsis" value="디즈니·픽사의 대표작 <인사이드 아웃>
				새로운 감정과 함께 돌아오다!				
				13살이 된 라일리의 행복을 위해 매일 바쁘게 머릿속 감정 컨트롤 본부를 운영하는
				‘기쁨’, ‘슬픔’, ‘버럭’, ‘까칠’, ‘소심’.				
				그러던 어느 날,
				낯선 감정인 ‘불안’, ‘당황’, ‘따분’, ‘부럽’이가 본부에 등장하고,
				언제나 최악의 상황을 대비하며 제멋대로인 ‘불안’이와 기존 감정들은 계속 충돌한다.				
				결국 새로운 감정들에 의해 본부에서 쫓겨나게 된 기존 감정들은
				다시 본부로 돌아가기 위해 위험천만한 모험을 시작하는데…				
				2024년, 전 세계를 공감으로 물들인 유쾌한 상상이 다시 시작된다!."/>
            </c:when>
            <c:when test="${param.movieId == '20212932'}">
                <c:set var="movieTitle" value="탈주"/>
                <c:set var="movieGenres" value="액션"/>
                <c:set var="movieDirector" value="이종필"/>
				<c:set var="movieRelease" value=" 24.07.03"/>
                <c:set var="movieCountry" value="한국"/>
                <c:set var="movieRuntime" value="94분"/>
                <c:set var="movieCast" value="이제훈 | 구교환 | 홍사빈"/>
                <c:set var="movieRating" value="12세 이상관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20212932&size=210"/>
                <c:set var="movieSynopsis" value="“내 앞 길 내가 정했습니다”
				휴전선 인근 북한 최전방 군부대.
				10년 만기 제대를 앞둔 중사 ‘규남’(이제훈)은 미래를 선택할 수 없는 북을 벗어나
				원하는 것을 해 볼 수 있는 철책 너머로의 탈주를 준비한다.
				그러나, ‘규남’의 계획을 알아챈 하급 병사 ‘동혁’(홍사빈)이 먼저 탈주를 시도하고,
				말리려던 ‘규남’까지 졸지에 탈주병으로 체포된다.
				
				“허튼 생각 말고 받아들여. 이것이 니 운명이야”
				탈주병 조사를 위해 부대로 온 보위부 소좌 ‘현상’(구교환)은
				어린 시절 알고 지내던 ‘규남’을 탈주병을 체포한 노력 영웅으로 둔갑시키고
				사단장 직속보좌 자리까지 마련해주며 실적을 올리려 한다.
				
				하지만 ‘규남’이 본격적인 탈출을 감행하자 ‘현상’은 물러설 길 없는 추격을 시작한다."/>
            </c:when>
            <c:when test="${param.movieId == '20208245'}">
                <c:set var="movieTitle" value="핸섬가이즈"/>
                <c:set var="movieGenres" value="코미디"/>
                <c:set var="movieDirector" value="남동협"/>
				<c:set var="movieRelease" value="24.06.26"/>
                <c:set var="movieCountry" value="한국"/>
                <c:set var="movieRuntime" value="101분"/>
                <c:set var="movieCast" value="이성민 | 이희준 | 공승연 | 박지환 | 이규형 | 우현"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20208245&size=210"/>
                <c:set var="movieSynopsis" value="한번 보면 절대 잊을 수 없는 ‘재필’과 ‘상구’가 전원생활을 꿈꾸며 새집으로 이사 온 날,
지하실에 봉인됐던 악령이 깨어나며 벌어지는 고자극 오싹 코미디"/>
            </c:when>
            <c:when test="${param.movieId == '20248465'}">
                <c:set var="movieTitle" value="하이재킹"/>
                <c:set var="movieGenres" value="범죄"/>
                <c:set var="movieDirector" value="김성한"/>
				<c:set var="movieRelease" value="24.06.21"/>
                <c:set var="movieCountry" value="한국 "/>
                <c:set var="movieRuntime" value="100분"/>
                <c:set var="movieCast" value=" 하정우 | 여진구 | 성동일 | 채수빈"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20248465&size=210"/>
                <c:set var="movieSynopsis" value="1971년 겨울 속초공항
여객기 조종사 태인(하정우)과 규식(성동일)은 김포행 비행에 나선다.
승무원 옥순(채수빈)의 안내에 따라 탑승 중인 승객들의 분주함도 잠시,
이륙한지 얼마 되지 않아 사제폭탄이 터지며 기내는 아수라장이 된다.

지금부터 이 비행기 이북 간다

여객기를 통째로 납치하려는 용대(여진구)는
조종실을 장악하고 무작정 북으로 기수를 돌리라 협박한다.

폭발 충격으로 규식은 한 쪽 시력을 잃고
혼란스러운 기내에서 절체절명의 상황에 처한 태인.
이들은 여객기를 무사히 착륙시키기 위한 사투를 시작하는데...

대한민국 상공 여객기 납치 사건
이 비행에 모두가 목숨을 걸었다!"/>
            </c:when>
            <c:when test="${param.movieId == '20247811'}">
                <c:set var="movieTitle" value="콰이어트 플레이스: 첫째 날"/>
                <c:set var="movieGenres" value="스릴러"/>
                <c:set var="movieDirector" value="마이클 사노스키"/>
				<c:set var="movieRelease" value="24.06.26"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="99 분"/>
                <c:set var="movieCast" value="루피타 뇽오 | 조셉 퀸 | 디몬 하운수 | 알렉스 울프"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20247811&size=210"/>
                <c:set var="movieSynopsis" value="쉿, 살고 싶다면 절대 소리내지 말 것!

평균 소음 90 데시벨을 자랑하는 미국 최대도시 뉴욕,
고양이 ‘프로도’와 함께 간만에 외출을 나온 ‘사미라’는 공연을 보고 돌아가던 중
하늘에서 떨어져 내리는 섬광을 목격하고 곧 사람들을 닥치는 대로 공격하는
정체불명 괴생명체의 출현에 충격에 휩싸인다.

아수라장이 된 뉴욕 도심에 ‘절대 소리 내지 말라’는 안내방송이 울려퍼지는 가운데
맨해튼의 모든 다리가 폭격으로 끊어지고, 사람들은 온갖 위협이 도사리는 도시에 고립되고 만다.

살아남기 위해 홀로 사투를 벌이던 '사미라'는 우연히 또 다른 생존자 ‘에릭’을 만나고
두 사람은 괴생명체를 피해 지하철역부터 시가지, 할렘까지 숨죽인 여정을 이어 나가는데…"/>
            </c:when>
            <c:when test="${param.movieId == '20235926'}">
                <c:set var="movieTitle" value="퍼펙트 데이즈"/>
                <c:set var="movieGenres" value="드라마"/>
                <c:set var="movieDirector" value="빔 벤더스"/>
				<c:set var="movieRelease" value="24.07.03"/>
                <c:set var="movieCountry" value="일본 "/>
                <c:set var="movieRuntime" value="124분"/>
                <c:set var="movieCast" value="야쿠쇼 코지 | 에모토 토키오 | 카노 아리사"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20235926&size=210"/>
                <c:set var="movieSynopsis" value="도쿄 시부야의 공공시설 청소부 ‘히라야마’는 매일 반복되지만 충만한 일상을 살아간다.

오늘도 그는 카세트 테이프로 올드 팝을 듣고,
필름 카메라로 나무 사이에 비치는 햇살을 찍고,
자전거를 타고 단골 식당에 가서 술 한잔을 마시고,
헌책방에서 산 소설을 읽으며 하루를 마무리한다.

그러던 어느 날, 사이가 소원한 조카가 찾아오면서 그의 반복되는 일상에 작은 변화가 생긴다."/>
            </c:when>
            <c:when test="${param.movieId == '20247397'}">
                <c:set var="movieTitle" value="존 오브 인터레스트"/>
                <c:set var="movieGenres" value="드라마"/>
                <c:set var="movieDirector" value="조나단 글레이저"/>
				<c:set var="movieRelease" value="24.06.05"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="104분"/>
                <c:set var="movieCast" value="크리스티안 프리에델 | 산드라 휠러"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20247397&size=210"/>
                <c:set var="movieSynopsis" value="독일 장교 루돌프 회스(크리스티안 프리델)의 가족이 사는
그들만의 꿈의 왕국 아우슈비츠.
아내 헤트비히(산드라 휠러)가 정성스럽게 가꾼 꽃이 만발한 정원에는
재잘거리는 아이들의 웃음소리로 가득하다.

마치 한 폭의 그림 같은 집.

과연 악마는 다른 세상을 사는가?"/>
            </c:when>
            <c:when test="${param.movieId == '20248222'}">
                <c:set var="movieTitle" value="기동전사 건담 시드 프리덤"/>
                <c:set var="movieGenres" value="SF, 로맨스"/>
                <c:set var="movieDirector" value="후쿠다 미츠오"/>
				<c:set var="movieRelease" value="24.04.03"/>
                <c:set var="movieCountry" value="일본"/>
                <c:set var="movieRuntime" value="124분"/>
                <c:set var="movieCast" value="키라 야마토 | 라크스 클라인 | 신 아스카"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/kvAqmrZrV5Bip7QO6yNcu5sMN2z.jpg&size=210"/>
                <c:set var="movieSynopsis" value="C.E.75, 전쟁은 여전히 계속되고 있다. 
                독립운동, 블루 코스모스의 침공… 사태를 진정시키기 위해 라크스를 
                초대 총재로 내세운 세계평화감시기구 컴퍼스가 창설되고, 키라와 
                부대원들은 컴퍼스의 일원이 되어 각지에서 벌어지는 전투에 참여한다. 
                그런 와중에 신흥국 파운데이션이 블루 코스모스의 본거지를 공격하는 합동 작전을 제안한다."/>
            </c:when>
            <c:when test="${param.movieId == '20240541'}">
                <c:set var="movieTitle" value="언더더씨: 마법 산호초를 찾아서"/>
                <c:set var="movieGenres" value="액션, 애니메이션"/>
                <c:set var="movieDirector" value="피터 팝"/>
				<c:set var="movieRelease" value="24.06.27"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="66분"/>
                <c:set var="movieCast" value="개구쟁이 열대어 쇼티 | 똑똑한 인디 | 의리파 톱상어 제이크"/>
                <c:set var="movieRating" value="전체관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/leqNCdZwW13JKZfXWV0nEM0kC56.jpg&size=210"/>
                <c:set var="movieSynopsis" value="구해줘! 홈즈~~
산호초 물고기 삼총사의 짠 내 나는
새집 찾기 모험!
전설의 마법 산호초를 찾아 떠나는
리얼 생생 해양 에듀벤처!
 
무분별하게 물고기를 포획하는
트롤 어선에 의해 산호초 집이 파괴되며
물고기들은 하루아침에 집을 잃고 만다.
개구쟁이 열대어 쇼티와
똑똑한 인디, 의리의 톱상어 제이크는
영원히 파괴되지 않는 전설 속의 마법 산호초를 찾아
미지의 바닷속으로 모험을 떠나는데....
“구해줘! 홈즈~~!” 산호초 물고기 삼총사의 짠 내 나는
새집 찾기 리얼 생생 모험이 펼쳐진다!"/>
            </c:when>
            <c:when test="${param.movieId == '20240926'}">
                <c:set var="movieTitle" value="만천과해"/>
                <c:set var="movieGenres" value="범죄, 스릴러"/>
                <c:set var="movieDirector" value="주오 첸"/>
				<c:set var="movieRelease" value="24.07.03"/>
                <c:set var="movieCountry" value="중국"/>
                <c:set var="movieRuntime" value="106분"/>
                <c:set var="movieCast" value="허광한 | 장균녕 | 혜영홍 | 윤정 外"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/zfoRPpQJWaWmLsnu0L9ZtdyoHcB.jpg&size=210"/>
                <c:set var="movieSynopsis" value="부와 명예를 가진 유명 사업가의 아내 ‘조안나’는 전 연인 ‘밍하오’와 
                밀회 중 잔인한 밀실 살인 사건에 휘말리고, 유력한 용의자로 지목된다. 그렇게 하루아침에 절벽 끝으로 내몰린 그녀에게 
                형사 ‘정웨이’가 찾아온다. ‘정웨이’는 ‘조안나’에게 무죄를 입증할 유일한 사람은 본인뿐이라며 거래를 제안한다. 조작된 증거를 
                뒤집을 수 있는 제한 시간은 단 2시간. 
                진실에 다가설수록 더욱 미궁 속에 빠져드는 무죄 입증 스릴러!"/>
            </c:when>
            <c:when test="${param.movieId == '533535'}">
                <c:set var="movieTitle" value="데드풀과 울버린"/>
                <c:set var="movieGenres" value="코미디, 액션"/>
                <c:set var="movieDirector" value="숀 레비"/>
				<c:set var="movieRelease" value="24.07.24"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="127분"/>
                <c:set var="movieCast" value="라이언 레이놀즈 | 휴 잭맨"/>
                <c:set var="movieRating" value="미정"/>               
                <c:set var="moviePoster" value="https://file.cineq.co.kr/i.aspx?movieid=20247781&size=210"/>
                <c:set var="movieSynopsis" value="히어로 생활에서 은퇴한 후, 평범한 중고차 딜러로 살아가던 ‘데드풀’이 예상치 못한 거대한 위기를 맞아 모든 면에서 상극인 ‘울버린’을 찾아가게 되며 펼쳐지는 도파민 폭발 액션 블록버스터"/>
            </c:when>
            <c:when test="${param.movieId == '1114738'}">
                <c:set var="movieTitle" value="본야드"/>
                <c:set var="movieGenres" value="액션, 스릴러"/>
                <c:set var="movieDirector" value="아시프 아크바르"/>
				<c:set var="movieRelease" value="24.07.05"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="96분"/>
                <c:set var="movieCast" value="멜 깁슨 | 노라 제헤트너"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/xkNK36hQv8SWiwiQoE7naRfP0zL.jpg&size=210"/>
                <c:set var="movieSynopsis" value="카터 경찰서장이 11명의 여성 시신을 발견한 후, FBI 특수요원 페트로빅은 악명 높은 골든 살인 사건에 책임이 있는 연쇄 살인범의 프로필을 밝히기 위해 모집됩니다. 경찰, 마약 수사국, FBI가 서로 얽히면서 얽힌 음모가 모든 사람을 용의자로 만듭니다."/>
            </c:when>
            <c:when test="${param.movieId == '718821'}">
                <c:set var="movieTitle" value="트위스터스"/>
                <c:set var="movieGenres" value="재난, 액션, 어드벤처"/>
                <c:set var="movieDirector" value="리 아이작 정"/>
				<c:set var="movieRelease" value="24.08.14"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="122분"/>
                <c:set var="movieCast" value="데이지 에드거존스 | 글렌 파월 | 앤서니 라모스"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/tUcsI0YvP7KQKsbxkElRwfP6UUf.jpg&size=210"/>
                <c:set var="movieSynopsis" value="재난에 정면돌파하는 인간들의 도전을 스펙터클하게 그려내 흥미를 더한다. 과거 토네이도를 쫓다가 겪은 사고로 트라우마를 겪고 있는 '케이트'에게 옛 친구 '하비'가 찾아와 토네이도를 없앨 방법이 있다며 한번 더 도전하자고 제안한다."/>
            </c:when>
            <c:when test="${param.movieId == '974262'}">
                <c:set var="movieTitle" value="디센던츠: 레드의 반항"/>
                <c:set var="movieGenres" value="판타지, 뮤지컬"/>
                <c:set var="movieDirector" value="제니퍼 팽"/>
				<c:set var="movieRelease" value="24.07.12"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="94분"/>
                <c:set var="movieCast" value="카일리 캔트럴 | 말리아 베이커 | 브랜디"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/t9u9FWpKlZcp0Wz1qPeV5AIzDsk.jpg&size=210"/>
                <c:set var="movieSynopsis" value="오라돈의 교장이 된 우마는 새로운 학생을 초청한다. 바로 원더랜드의 포악한 하트 여왕의 반항아 딸 레드. 오라돈과 신데렐라에게 오랜 앙심을 품고 있던 하트 여왕은 레드를 보내 복수할 기회를 노린다. 하트 여왕이 오라돈을 차지하려는 움직임을 보이자 레드는 신데렐라의 완벽주의자 딸 클로이와 과거로 돌아가 엄마가 악당의 길로 가지 못하게 막으려 애쓴다."/>
            </c:when>
            <c:when test="${param.movieId == '1226578'}">
                <c:set var="movieTitle" value="롱레그스"/>
                <c:set var="movieGenres" value="공포, 스릴러"/>
                <c:set var="movieDirector" value="오스굿 퍼킨스"/>
				<c:set var="movieRelease" value="24.07.12"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="101분"/>
                <c:set var="movieCast" value="마이카 먼로 | 니콜라스 케이지"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="&size=210"/>
                <c:set var="movieSynopsis" value="FBI 요원 리 하커는 찾기 힘든 연쇄 살인범의 미해결 사건에 배정된 재능 있는 신입 요원이다. 사건이 복잡하고, 오컬트 관습과의 연관성을 밝혀내는 증거가 사라지면서, 하커는 무자비한 살인범과의 개인적 연관성을 발견하고, 그가 다시 공격하기 전에 그를 막기 위해 시간과 경주해야 한다."/>
            </c:when>
            <c:when test="${param.movieId == '912649'}">
                <c:set var="movieTitle" value=" 베놈: 라스트 댄스"/>
                <c:set var="movieGenres" value="안티히어로"/>
                <c:set var="movieDirector" value="켈리 마르셀"/>
				<c:set var="movieRelease" value="24.10.25"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="미정"/>
                <c:set var="movieCast" value="톰 하디 | 주노 템플"/>
                <c:set var="movieRating" value="미정"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/3flIDcZF3tnR7m5OU2h7lLPQwmr.jpg&size=210"/>
                <c:set var="movieSynopsis" value=""/>
            </c:when>
            <c:when test="${param.movieId == '558449'}">
                <c:set var="movieTitle" value="글래디에이터 II"/>
                <c:set var="movieGenres" value="액션, 드라마, 역사"/>
                <c:set var="movieDirector" value="리들리 스콧"/>
				<c:set var="movieRelease" value="24.11"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="미정"/>
                <c:set var="movieCast" value="폴 메스칼 | 페드로 파스칼 | 코니 닐슨"/>
                <c:set var="movieRating" value="미정"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/hEW6tMHTVvxTqBaY2VjZY2USmPf.jpg&size=210"/>
                <c:set var="movieSynopsis" value=""/>
            </c:when>
            <c:when test="${param.movieId == '726139'}">
                <c:set var="movieTitle" value="탈출: 프로젝트 사일런스"/>
                <c:set var="movieGenres" value="재난, 스릴러, 첩보"/>
                <c:set var="movieDirector" value="김태곤"/>
				<c:set var="movieRelease" value="24.07.12"/>
                <c:set var="movieCountry" value="한국"/>
                <c:set var="movieRuntime" value="96분"/>
                <c:set var="movieCast" value="이선균 | 주지훈 | 김희원"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/7eYasyaCvfJRHdnYl24jqPhf9y0.jpg&size=210"/>
                <c:set var="movieSynopsis" value="짙은 안개 속 연쇄 추돌 사고가 일어나고, 붕괴 위기의 공항대교에 풀려난 통제불능의 군사용 실험견들로부터 살아남기 위해 극한의 사투를 벌이는 사람들의 이야기"/>
            </c:when>
            <c:when test="${param.movieId == '845781'}">
                <c:set var="movieTitle" value="레드 원"/>
                <c:set var="movieGenres" value="모험, 액션, 코미디"/>
                <c:set var="movieDirector" value="제이크 캐스던"/>
				<c:set var="movieRelease" value="24.11"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="미정"/>
                <c:set var="movieCast" value="드웨인 존슨 | 크리스 에반스 | 루시 리우"/>
                <c:set var="movieRating" value="12세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/eLOd23JdmXDifFjfDV3teRKljZg.jpg&size=210"/>
                <c:set var="movieSynopsis" value=""/>
            </c:when>
            <c:when test="${param.movieId == '539972'}">
                <c:set var="movieTitle" value=" 크레이븐 더 헌터"/>
                <c:set var="movieGenres" value="안티히어로, 액션, 어드벤처, SF"/>
                <c:set var="movieDirector" value="J.C. 챈더"/>
				<c:set var="movieRelease" value="24.12"/>
                <c:set var="movieCountry" value="미국"/>
                <c:set var="movieRuntime" value="미정"/>
                <c:set var="movieCast" value="에런 테일러존슨 | 러셀 크로우 | 아리아나 드보즈"/>
                <c:set var="movieRating" value="15세이상관람가"/>               
                <c:set var="moviePoster" value="https://image.tmdb.org/t/p/w200/1GvBhRxY6MELDfxFrete6BNhBB5.jpg&size=210"/>
                <c:set var="movieSynopsis" value="《크레이븐 더 헌터》(영어: Kraven the Hunter)는 2024년 개봉 예정인 미국의 슈퍼히어로 영화이다. J.C. 챈더가 감독을 맡았으며, 마블 코믹스의 캐릭터 사냥꾼 크레이븐을 주인공으로 한 작품이다. 소니스 스파이더맨 유니버스(SSU)의 네 번째 작품이다. 배우 에런 테일러존슨이 크레이븐을 연기한다."/>
            </c:when>
   
            <c:otherwise>
                <p>영화 정보를 찾을 수 없습니다.</p>
            </c:otherwise>
        </c:choose>
        <img src="${moviePoster}" alt="${movieTitle} 포스터" class="movie-poster">
        <div class="movie-details">
            <h2>${movieTitle}</h2> <br>
            <p><strong>줄거리:</strong> ${movieSynopsis}</p> <br>
            <p><strong>장르:</strong> ${movieGenres}</p> <br>
            <p><strong>감독:</strong> ${movieDirector}</p> <br>
            <p><strong>개봉일:</strong> ${movieRelease}</p> <br>
            <p><strong>출시 국가:</strong> ${movieCountry}</p> <br>
            <p><strong>러닝타임:</strong> ${movieRuntime}</p> <br>
            <p><strong>출연 배우:</strong> ${movieCast}</p> <br>
            <p><strong>등급:</strong> ${movieRating}</p>
        </div>
        <a href="${pageContext.request.contextPath}/Boxoffice" class="back-link">박스오피스 페이지로 돌아가기</a>
    </div>
    <footer>       
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>
