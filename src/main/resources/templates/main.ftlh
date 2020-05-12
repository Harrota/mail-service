<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page "Greeting">
<body>
<div>
<@l.logout/>
</div>
<div>
    <form method="post" action="/main">
        <input type="text" name="email" placeholder="Кому">
        <input type="text" name="subject" placeholder="Тема">
        <input type="text" name="text" placeholder="Текст">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Отправить</button>
    </form>
</div>
<div>Letters List</div>
<form method="get" action="/main">
    <input type="text" name="filter">
    <button type="submit">Apply Filter</button>
</form>
<#list letters as letter>
    <div id="letters">
        <b>${letter.id}  ${letter.subject}</b>
        <span>${letter.text}</span>
        <strong>${letter.authorName}</strong>
    </div>
    <#else>
    No letters yet
</#list>
</body>
</@c.page>