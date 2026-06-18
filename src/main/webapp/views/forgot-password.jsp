<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu - OE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

```
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    body{
        min-height:100vh;
        background:linear-gradient(135deg,#fff5f8,#fffaf0);
        font-family:'Plus Jakarta Sans',sans-serif;
        display:flex;
        align-items:center;
        justify-content:center;
    }

    .card-cute{
        width:480px;
        background:rgba(255,255,255,.92);
        border:1px solid #ffe0ea;
        border-radius:28px;
        box-shadow:0 18px 45px rgba(255,92,138,.16);
        padding:2.6rem;
    }

    .brand-logo{
        font-size:1.45rem;
        font-weight:800;
        text-decoration:none;
        background:linear-gradient(135deg,#ff5c8a,#ff8a5c);
        -webkit-background-clip:text;
        -webkit-text-fill-color:transparent;
    }

    .icon-circle{
        width:64px;
        height:64px;
        border-radius:50%;
        background:#fff0f6;
        color:#ff4f86;
        display:flex;
        align-items:center;
        justify-content:center;
        margin:18px auto;
        box-shadow:0 10px 20px rgba(255,92,138,.12);
    }

    .form-label{
        font-size:.88rem;
        font-weight:800;
        color:#495057;
    }

    .form-control{
        border-radius:999px;
        padding:12px 18px;
        border:1px solid #ffd6e5;
    }

    .form-control:focus{
        border-color:#ff5c8a;
        box-shadow:0 0 0 4px rgba(255,92,138,.15);
    }

    .btn-cute{
        background:linear-gradient(135deg,#ff5c8a,#ff8a5c);
        color:white;
        border:none;
        font-weight:800;
        border-radius:999px;
        padding:12px;
        box-shadow:0 10px 22px rgba(255,92,138,.25);
    }

    .btn-cute:hover{
        color:white;
        opacity:.93;
    }

    .cute-link{
        color:#ff4f86;
        font-weight:800;
        text-decoration:none;
    }

    .cute-link:hover{
        color:#e91e63;
    }

    .alert-success{
        border-radius:18px;
        border:none;
    }

    .alert-danger{
        border-radius:18px;
        border:none;
    }
</style>
```

</head>

<body>

<div class="card-cute">

```
<div class="text-center mb-4">

    <a href="<%= request.getContextPath() %>/home" class="brand-logo">
        ✨ ONLINE ENTERTAINMENT
    </a>

    <div class="icon-circle">
        <i class="fa-solid fa-key"></i>
    </div>

    <h3 class="fw-bold mb-1">Quên mật khẩu</h3>

    <p class="text-muted small mb-0">
        Nhập thông tin để đặt lại mật khẩu 🌷
    </p>

</div>

<% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success">
        <%= request.getAttribute("message") %>
    </div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
<% } %>

<form action="<%= request.getContextPath() %>/forgot-password" method="post">

    <div class="mb-3">
        <label class="form-label">Tên đăng nhập</label>
        <input type="text" name="id" class="form-control"
               placeholder="Nhập username của bạn" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control"
               placeholder="Nhập email đã đăng ký" required>
    </div>

    <div class="mb-4">
        <label class="form-label">Mật khẩu mới</label>
        <input type="password" name="newPassword" class="form-control"
               placeholder="Nhập mật khẩu mới" required>
    </div>

    <button class="btn btn-cute w-100">
        Đổi mật khẩu
        <i class="fa-solid fa-arrow-right ms-1"></i>
    </button>

</form>

<div class="text-center mt-4">
    <a href="<%= request.getContextPath() %>/login" class="cute-link">
        ← Quay lại đăng nhập
    </a>
</div>
```

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
