<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.example.Model.Video" %>


<%
    Video video = (Video) request.getAttribute("video");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><%= video.getTitle() %> - OE</title>
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

        .brand-logo {
            font-size: 1.45rem;
            font-weight: 800;
            text-decoration: none;
            background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .top-bar {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid #ffe0ea;
        }

        .detail-card {
            background: rgba(255, 255, 255, 0.92);
            border: 1px solid #ffe0ea;
            border-radius: 28px;
            box-shadow: 0 18px 45px rgba(255, 92, 138, 0.14);
            overflow: hidden;
        }

        .video-frame {
            width: 100%;
            aspect-ratio: 16 / 9;
            border: 0;
            display: block;
        }

        .video-title {
            font-weight: 800;
            color: #2b2b2b;
            line-height: 1.35;
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

        .btn-like {
            background: #fff0f6;
            color: #ff4f86;
            border: 1px solid #ffd1e2;
            font-weight: 800;
            border-radius: 999px;
            padding: 11px 20px;
        }

        .btn-like:hover {
            background: #ff4f86;
            color: white;
        }

        .btn-share {
            background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
            color: white;
            border: none;
            font-weight: 800;
            border-radius: 999px;
            padding: 11px 20px;
            box-shadow: 0 10px 22px rgba(255, 92, 138, 0.22);
        }

        .btn-share:hover {
            color: white;
            opacity: 0.93;
        }

        .form-control {
            border-radius: 999px;
            padding: 11px 18px;
            border: 1px solid #ffd6e5;
        }

        .form-control:focus {
            border-color: #ff5c8a;
            box-shadow: 0 0 0 4px rgba(255, 92, 138, 0.15);
        }
    </style>
</head>

<body>

<header class="top-bar">
    <div class="container py-3 d-flex justify-content-between align-items-center">
        <a href="<%= request.getContextPath() %>/home" class="brand-logo">
            ✨ ONLINE ENTERTAINMENT
        </a>

        <a href="<%= request.getContextPath() %>/home" class="cute-pill">
            <i class="fa-solid fa-house me-2"></i>Trang chủ
        </a>
    </div>
</header>

<main class="container py-5">

    <div class="detail-card">

        <iframe class="video-frame"
                src="https://www.youtube.com/embed/<%= video.getId() %>"
                allowfullscreen>
        </iframe>

        <div class="p-4 p-md-5">

            <h2 class="video-title mb-3">
                <%= video.getTitle() %>
            </h2>

            <p class="text-muted mb-3">
                <i class="fa-regular fa-eye me-2"></i>
                <%= video.getViews() %> lượt xem
            </p>

            <p class="mb-4 text-secondary" style="line-height: 1.8;">
                <%= video.getDescription() %>
            </p>

            <div class="row g-3 align-items-center">

                <div class="col-md-3">
                    <form action="<%= request.getContextPath() %>/favorite" method="get">
                        <input type="hidden" name="videoId" value="<%= video.getId() %>">
                        <button type="submit" class="btn btn-like w-100">
                            <i class="fa-solid fa-heart me-2"></i>Thích
                        </button>
                    </form>
                </div>

                <div class="col-md-9">
                    <form action="<%= request.getContextPath() %>/share" method="post" class="d-flex gap-2">
                        <input type="hidden" name="videoId" value="<%= video.getId() %>">
                        <input type="email" name="email" class="form-control"
                               placeholder="Nhập email để chia sẻ video này..." required>
                        <button type="submit" class="btn btn-share">
                            <i class="fa-regular fa-paper-plane me-2"></i>Share
                        </button>
                    </form>
                </div>

            </div>

        </div>

    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>