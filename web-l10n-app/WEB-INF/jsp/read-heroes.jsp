<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/jsp/common/jstl-connect.jsp"  %>
<html>
<head>
    <title>Read Heroes</title>
    <%@include file="/WEB-INF/jsp/common/css-connect.jsp"  %>
</head>
<body>
<header>
    <nav class="navbar">
        <div class="col">
            <img class="rounded" src="static/hero.jpg" width="150" height="150" alt="hero.jpg">
        </div>
        <div class="col-1">
            <form action="${pageContext.request.contextPath}/localeChange">
                <p><input type="submit" name="locale" value="English"></p>
                <p><input type="submit" name="locale" value="France"></p>
                <p><input type="submit" name="locale" value="Germany"></p>
                <input type="submit" name="locale" value="Russian">
                <input type="hidden" name="referrer" value="/WEB-INF/jsp/read-heroes.jsp">
            </form>
        </div>
        <%@include file="/WEB-INF/jsp/common/header.jsp"  %>
</header>
<main>
    <nav class="navbar">
        <div class="col-4"></div>
        <div class="col-4">
            <h4 class="p-3">Heroes</h4>
            <c:forEach items="${sessionScope.heroesList}" var="heroes">
                <table border="1" class="border border-primary">
                    <tr>
                        <td class="pl-3">
                            <a href="${pageContext.request.contextPath}/heroServlet?heroId=${heroes.id}">
                                ${heroes.name}
                            </a>
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </div>
        <div class="col-4"></div>
    </nav>
</main>
<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>
