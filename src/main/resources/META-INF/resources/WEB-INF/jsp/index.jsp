
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Todo List</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 680px; margin: 40px auto; }
        h1 { margin-bottom: 8px; }
        form { margin: 12px 0; }
        input[type="text"] { padding: 8px; width: 70%; }
        button { padding: 8px 12px; margin-left: 8px; }
        ul { list-style: none; padding-left: 0; }
        li { display: flex; align-items: center; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee; }
        .title { flex: 1; }
    </style>
</head>
<body>
    <h1>Todo List</h1>

    <!-- Add Form -->
    <form action="${pageContext.request.contextPath}/add" method="post">
        <input type="text" name="title" placeholder="Enter a todo..." required />
        <button type="submit">Add</button>
    </form>

    <!-- List -->
    <ul>
        <c:forEach var="t" items="${todos}">
            <li>
                <span class="title">${t.title}</span>
                <form action="${pageContext.request.contextPath}/delete" method="post" style="margin:0;">
                    <input type="hidden" name="id" value="${t.id}" />
                    <button type="submit">Delete</button>
                </form>
            </li>
        </c:forEach>
        <c:if test="${empty todos}">
            <li>No items yet. Add your first todo above!</li>
        </c:if>
    </ul>
</body>
</html>
