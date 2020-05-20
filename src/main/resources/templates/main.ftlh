<#import "parts/common.ftlh" as c>
<@c.page "Greeting">
    <body>
    <div class="mt-3">
        <button class="ml-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Send email
        </button>
    </div>

    <div class="mt-5">
        <form method="post" action="/main" class="collapse" id="collapseExample">
            <input type="text" name="email" placeholder="To">
            <input type="text" name="subject" placeholder="Subject">
            <input type="text" name="text" placeholder="Text">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="ml-2">Отправить</button>
        </form>
    </div>
    <div class="form-row mt-5">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" placeholder="Filter">
                <button type="submit" class="ml-2">Apply Filter</button>
            </form>
        </div>
    </div>
    <div class="container mt-3" style="width: 70%;">Letters List</div>
    <div class="container mt-3" style="width: 70%;">

        <#list letters as letter>
            <div class="card my-4">
                <b class="my-1">${letter.subject}</b>
                <span>${letter.text}</span>
                <div class="card-footer text-muted ">
                    ${letter.authorName}
                </div>

            </div>
        <#else>
            No letters yet
        </#list>


    </div>
    </body>
</@c.page>