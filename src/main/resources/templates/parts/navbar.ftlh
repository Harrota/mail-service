<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/main">Main</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/main">Inbox</a>
            </li>
<#--            <li class="nav-item">-->
<#--                <a class="nav-link" href="/outbox">Outbox</a>-->
<#--            </li>-->
        </ul>
        <@l.logout/>
        <div class="navbar-text ml-3">${name}</div>
    </div>
</nav>