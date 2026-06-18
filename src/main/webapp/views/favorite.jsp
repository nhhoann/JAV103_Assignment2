<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Video đã thích - OE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            min-height: 100vh;
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
            font-size: 1.45rem;
            font-weight: 800;
            text-decoration: none;
            background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .cute-pill {
            border-radius: 999px;
            padding: 10px 18px;
            font-weight: 800;
            border: 1px solid #ffd6e5;
            background: #fff;
            color: #ff4f86;
            text-decoration: none;
        }

        .cute-pill:hover {
            background: #fff0f6;
            color: #e91e63;
        }

        .page-title {
            font-weight: 800;
            color: #2b2b2b;
        }

        .video-card {
            background: rgba(255, 255, 255, 0.92);
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
            display: block;
        }

        .video-title {
            font-size: 1rem;
            font-weight: 800;
            color: #333;
            height: 48px;
            overflow: hidden;
            line-height: 1.45;
        }

        .empty-box {
            background: rgba(255, 255, 255, 0.92);
            border: 1px dashed #ffc2d8;
            border-radius: 28px;
            padding: 60px 20px;
            box-shadow: 0 14px 35px rgba(255, 92, 138, 0.08);
        }

        .empty-icon {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: #fff0f6;
            color: #ff4f86;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
            box-shadow: 0 10px 20px rgba(255, 92, 138, 0.12);
        }
    </style>
</head>

<body>

<header class="top-bar">
    <div class="container py-3 d-flex justify-content-between align-items-center">
        <a href="${pageContext.request.contextPath}/home" class="brand-logo">
            ✨ ONLINE ENTERTAINMENT
        </a>

        <a href="${pageContext.request.contextPath}/home" class="cute-pill">
            <i class="fa-solid fa-house me-2"></i>Trang chủ
        </a>
    </div>
</header>

<main class="container py-5">

    <div class="mb-4">
        <h2 class="page-title mb-1">
            Video đã thích 💖
        </h2>
        <p class="text-muted mb-0">
            Những video bạn đã thả tim sẽ xuất hiện ở đây.
        </p>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <c:choose>
            <c:when test="${not empty videos}">
                <c:forEach var="v" items="${videos}">
                    <div class="col">
                        <div class="video-card h-100">

                            <a href="${pageContext.request.contextPath}/video-detail?id=${v.id}">
                                <img src="${v.poster}" class="video-poster" alt="${v.title}"
                                     onerror="this.src='https://via.placeholder.com/400x220?text=No+Image'">
                            </a>

                            <div class="p-3">
                                <a href="${pageContext.request.contextPath}/video-detail?id=${v.id}" class="text-decoration-none">
                                    <h5 class="video-title mb-2">
                                        ${v.title}
                                    </h5>
                                </a>

                                <p class="text-muted small mb-0">
                                    <i class="fa-regular fa-eye me-1"></i>
                                    ${v.views} lượt xem
                                </p>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="col-12">
                    <div class="empty-box text-center">
                        <div class="empty-icon">
                            <i class="fa-regular fa-heart fa-2x"></i>
                        </div>

                        <h5 class="fw-bold mb-2">
                            Bạn chưa thích video nào
                        </h5>

                        <p class="text-muted mb-4">
                            Về trang chủ và thả tim một video bạn thích nha 🌷
                        </p>

                        <a href="${pageContext.request.contextPath}/home" class="cute-pill">
                            Khám phá video
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>