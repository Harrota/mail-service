<#import "parts/common.ftlh" as c>
<@c.page "Registration">
    <body>
    ${message!" "}
    <div class="mx-auto mt-3 mb-5" style="width: 50%;">Registration</div>
    <form action="/registration" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Username </label>
            <div class="col-sm-5">
                <input type="text" name="username" class="form-control"/>
            </div>
        </div>
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
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div><input type="submit" value="Sign In"/></div>
    </form>
    </body>
</@c.page>