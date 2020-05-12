<#import "parts/common.ftlh" as c>
<@c.page "Log in">
    <body>
    Log in
    <form action="/login" method="post">
        <div><label> Email : <input type="email" name="email"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div><input type="submit" value="Log In"/></div>
    </form>
    <a href="/registration">Create new account</a>
    </body>
</@c.page>


