<!-- Sidebar user panel (optional) -->
<div class="user-panel mt-3 pb-3 mb-3 d-flex">
    <c:if test="${empty login}">
        <div class="image">
            <img src="${path}/dist/img/default-user-image.jpg" class="img-circle elevation-2" alt="User Image"></div>
        <div class="info">
                <%-- Status --%>
            <a href="#"><i class="fa fa-circle text-danger"></i> Guest</a>
        </div>
    </c:if>
    <c:if test="${not empty login}">
        <div class="image"><img src="${path}/dist/img/default-user-image.jpg" class="img-circle elevation-2" alt="User Image"></div>
        <div class="info">
                <%-- Status --%>
            <a href="#"><i class="d-block"></i> ${login.memName}</a>
        </div>
    </c:if></div>

