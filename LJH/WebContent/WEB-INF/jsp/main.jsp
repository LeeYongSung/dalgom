<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Untitled Document</title>
    <link rel="stylesheet" href="css/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $(".content-btn").click(function(){
                $(".hidden-nav").toggle(300);                
            });
        });
   </script>
</head>
<body>
    <nav>
        <div class="nav">
            <div>
                <a class="nav-tit nb" href="main.html">너의 이름은</a>
            </div>
            <div>
                <a href="#" class="content-btn">
                    <p>컨텐츠
                        <span class="icon">
                            <span class="icon2"></span>
                        </span>                        
                    </p>                    
                </a>
            </div>
            <div>
                <a href="">고객센터</a>
                <a href="">문의사항</a>
            </div>
            <div>
                <input class="nav-input" type="text" value="${MemName}">님 환영합니다
                <button class="logout-btn" onclick="location.href='index.html'">로그아웃</button>
            </div>
        </div>
    </nav>
    <div class="hidden-nav">
        <div class="hidden-nav-wrap">
            <button class="hidden-btn" onclick="location.href='contents.html'">영화</button>
            <button class="hidden-btn" onclick="location.href='#'">드라마</button>
            <button class="hidden-btn" onclick="location.href='#'">애니메이션</button>
            <button class="hidden-btn" onclick="location.href='#'">K-pop</button>
            <button class="hidden-btn" onclick="location.href='#'">예능</button>
            <button class="hidden-btn" onclick="location.href='#'">도서</button>
            <button class="hidden-btn" onclick="location.href='#'">만화</button>
            <button class="hidden-btn" onclick="location.href='#'">게임</button>
        </div>
    </div>        
    <section>
        <header></header>
        <div class="section">
            <div class="section-content">
                <a href="contents.html">
                    <div class="img img-1"></div>
                    <div>
                        <h2>영화</h2>
                        <p class="content-p">최신 영화 소개 컨텐츠</p>
                    </div>
                </a>
            </div>              
            <div class="section-content">
                <div class="img img-2"></div>
                <div>
                    <h2>드라마</h2>
                    <p class="content-p">최신 드라마 소개 컨텐츠</p>
                </div>
            </div>
            <div class="section-content">
                <div class="img img-3"></div>
                <div>
                    <h2>애니메이션</h2>
                    <p class="content-p">최신 애니 소개 컨텐츠</p>
                </div>
            </div>
            <div class="section-content">
                <div class="img img-4"></div>
                <div>
                    <h2>K-pop</h2>
                    <p class="content-p">최신 음악 소개 컨텐츠</p>
                </div>
            </div>
            <div class="section-content">
                <div class="img img-5"></div>
                <div>
                    <h2>예능</h2>
                    <p class="content-p">예능 소개 컨텐츠</p>
                </div>
            </div>
            <div class="section-content">
                <div class="img img-6"></div>
                <div>
                    <h2>도서</h2>
                    <p class="content-p">도서 소개 컨텐츠</p>
                </div>
            </div>
            <div class="section-content">
                <div class="img img-7"></div>
                <div>
                    <h2>만화</h2>
                    <p class="content-p">만화책 소개 컨텐츠</p>
                </div>
            </div>
            <div class="section-content">
                <div class="img img-8"></div>
                <div>
                    <h2>게임</h2>
                    <p class="content-p">게임 소개 컨텐츠</p>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <p>FOOTER</p>
    </footer>
    
    
    
</body>
</html>