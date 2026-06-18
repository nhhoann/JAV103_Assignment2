<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>OE Entertainment</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link
                href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <style>
                body {
                    background: linear-gradient(135deg, #fff5f8, #fffaf0);
                    font-family: 'Plus Jakarta Sans', sans-serif;
                }

                .top-bar {
                    background: rgba(255, 255, 255, 0.85);
                    backdrop-filter: blur(12px);
                    border-bottom: 1px solid #ffe0ea;
                    position: sticky;
                    top: 0;
                    z-index: 1000;
                }

                .brand-logo {
                    font-size: 1.55rem;
                    font-weight: 800;
                    text-decoration: none;
                    background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                }

                .cute-pill {
                    border-radius: 999px;
                    padding: 9px 18px;
                    font-weight: 700;
                    border: 1px solid #ffd6e5;
                    background: #fff;
                    color: #ff4f86;
                    text-decoration: none;
                }

                .cute-pill:hover {
                    background: #fff0f6;
                    color: #e91e63;
                }

                .btn-cute {
                    background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
                    color: white;
                    border: none;
                    font-weight: 700;
                    box-shadow: 0 8px 18px rgba(255, 92, 138, 0.25);
                }

                .section-title {
                    font-weight: 800;
                    color: #2b2b2b;
                }

                .video-card {
                    background: rgba(255, 255, 255, 0.9);
                    border: 1px solid #ffe0ea;
                    border-radius: 24px;
                    overflow: hidden;
                    transition: 0.25s;
                    box-shadow: 0 10px 25px rgba(255, 92, 138, 0.08);
                }

                .video-card:hover {
                    transform: translateY(-6px);
                    box-shadow: 0 18px 38px rgba(255, 92, 138, 0.18);
                }

                .video-poster {
                    width: 100%;
                    height: 210px;
                    object-fit: cover;
                }

                .video-title {
                    font-size: 1rem;
                    font-weight: 800;
                    color: #333;
                    height: 48px;
                    overflow: hidden;
                }

                .btn-like {
                    background: #fff0f6;
                    color: #ff4f86;
                    border: 1px solid #ffd1e2;
                    font-weight: 800;
                }

                .btn-like:hover {
                    background: #ff4f86;
                    color: white;
                }

                .btn-share {
                    background: #fffaf0;
                    color: #ff7a45;
                    border: 1px solid #ffe0c7;
                    font-weight: 800;
                }

                .btn-share:hover {
                    background: #ff7a45;
                    color: white;
                }

                .dropdown-menu {
                    border: 1px solid #ffd6e5;
                    border-radius: 20px;
                    padding: 12px;
                    background: rgba(255, 255, 255, .95);
                    backdrop-filter: blur(12px);

                    box-shadow: 0 15px 35px rgba(255, 92, 138, .15);

                    min-width: 220px;
                    margin-top: 10px;
                }

                .dropdown-item {
                    border-radius: 14px;
                    padding: 12px 16px;

                    font-weight: 700;
                    color: #444;

                    transition: all .2s ease;
                }

                .dropdown-item:hover {
                    background: #fff0f6;
                    color: #ff4f86;

                    transform: translateX(4px);
                }

                .dropdown-divider {
                    border-color: #ffe0ea;
                }
            </style>
        </head>

        <body>

            <header class="top-bar">
                <div class="container py-3 d-flex justify-content-between align-items-center gap-1">

                    <div class="d-flex align-items-center gap-2">
                        <a href="${pageContext.request.contextPath}/home" class="brand-logo">
                            ✨ ONLINE ENTERTAINMENT
                        </a>

                        <a href="${pageContext.request.contextPath}/favorites" class="cute-pill">
                            <i class="fa-solid fa-heart me-2"></i>My Favorites
                        </a>
                    </div>

                    <div class="d-flex align-items-center gap-2">
                        <c:choose>
                            <c:when test="${not empty sessionScope.currentUser}">
                                <span class="text-muted me-2">
                                    Xin chào, <b class="text-dark">${sessionScope.currentUser.fullname}</b>
                                </span>

                                <a href="${pageContext.request.contextPath}/edit-profile" class="btn cute-pill">
                                    Hồ sơ
                                </a>

                                <a href="${pageContext.request.contextPath}/changepassword" class="btn cute-pill">
                                    Đổi MK
                                </a>

                                <div class="dropdown">

                                    <button class="cute-pill dropdown-toggle" data-bs-toggle="dropdown">
                                        Quản trị
                                    </button>

                                    <ul class="dropdown-menu">
                                        <li>
                                            <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/admin/users">
                                                Quản lý User
                                            </a>
                                        </li>

                                        <li>
                                            <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/admin/videos">
                                                Quản lý Video
                                            </a>
                                        </li>

                                        <li>
                                            <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/admin/reports">
                                                Báo cáo
                                            </a>
                                        </li>
                                    </ul>

                                </div>

                                <a href="${pageContext.request.contextPath}/logout"
                                    class="btn btn-outline-danger rounded-pill px-3">
                                    Đăng xuất
                                </a>
                            </c:when>

                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login" class="btn cute-pill">
                                    Đăng nhập
                                </a>

                                <a href="${pageContext.request.contextPath}/register"
                                    class="btn btn-cute rounded-pill px-4">
                                    Đăng ký
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </header>

            <main class="container py-5">

                <div class="mb-4">
                    <h2 class="section-title mb-1">Video hôm nay</h2>
                </div>

                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="v" items="${videos}">
                        <div class="col">
                            <div class="video-card h-100">

                                <a href="${pageContext.request.contextPath}/video-detail?id=${v.id}">
                                    <img src="${v.poster}" class="video-poster" alt="${v.title}"
                                        onerror="this.src='https://via.placeholder.com/400x220?text=No+Image'">
                                </a>

                                <div class="p-3">
                                    <a href="${pageContext.request.contextPath}/video-detail?id=${v.id}"
                                        class="text-decoration-none">
                                        <h5 class="video-title mb-2">${v.title}</h5>
                                    </a>

                                    <p class="text-muted small mb-3">
                                        <i class="fa-regular fa-eye me-1"></i>${v.views} lượt xem
                                    </p>

                                    <div class="d-flex gap-2">
                                        <form action="${pageContext.request.contextPath}/favorite" method="post"
                                            class="flex-fill">
                                            <input type="hidden" name="videoId" value="${v.id}">
                                            <button type="submit" class="btn btn-like w-100 rounded-pill">
                                                <c:choose>
                                                    <c:when test="${likedVideos[v.id]}">
                                                        <i class="fa-solid fa-heart me-1"></i>Bỏ thích
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa-regular fa-heart me-1"></i>Thích
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </form>

                                        <a href="${pageContext.request.contextPath}/share?id=${v.id}"
                                            class="btn btn-share flex-fill rounded-pill">
                                            <i class="fa-regular fa-paper-plane me-1"></i>Chia sẻ
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>

            </main>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>s