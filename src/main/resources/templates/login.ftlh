<#import "parts/common.ftlh" as c>
<@c.page "Log in">
    <div class="mx-auto mt-3 mb-5" style="width: 50%;">Log in</div>
    <form action="/login" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email </label>
            <div class="col-sm-5">
                <input type="email" name="email" class="form-control"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control"/>
                <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                    <div class="alert alert-danger" role="alert">
                        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
                    </div>
                </#if>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div><input class="col-sm-7 mt-5" type="submit" value="Log In"/></div>
    </form>
    <button type="button" class="col-sm-7 mt-2" onclick="window.location.href = '/registration';">Create new account</button>
</@c.page>


