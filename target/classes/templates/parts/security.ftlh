<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        isLogged = user.isLogged()
    >
<#else>
    <#assign
        name = "unknown"
        isAdmin = false
        isLogged = false
    >
</#if>