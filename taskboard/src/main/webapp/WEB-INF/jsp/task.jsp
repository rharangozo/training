<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:choose>
    <c:when test="${not empty requestScope.task}">
        <c:set var="task" value="${requestScope.task}"/>        
    </c:when>
    <c:otherwise>
        <c:set var="task" value="${applicationScope['taskPrototype']}"/>
        <c:set var="cssClass" value="hidden"/>
    </c:otherwise>
</c:choose>


<%-- TODO 2: 
    The default view mode is line-through regardless of the previous view mode if any
    The website should remember the user's preference!
--%>
<li data-id="${task.id}" data-complete="${task.complete}" 
    class="${cssClass} ${task.complete eq true ? 'line-through' : ''}">

    <div class="hidden editor">
        <input type="text" value="${task.description}"/>
    </div>
    
    <div class="normal">
        <span class="desc">${task.description}</span>
        
        <c:forEach items="${task.tags}" var="tag">
            <span class="tag"><c:out value="${tag.tagName}"/></span>
        </c:forEach>
            
        <a class="rm-btn">&#10007;</a>
        <a class="done-btn">&#10003;</a>
    </div>
</li>
