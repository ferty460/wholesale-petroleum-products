<#macro login path>
    <form action="${path}" method="post" class="form_login">
        <input class="inp_log" type="text" name="username" placeholder="Имя" required/>
        <input class="inp_log" type="password" name="password" placeholder="Пароль" required/><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input class="btn_log" type="submit" name="Sign In"/>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input class="logout" type="submit" value="Выйти"/>
    </form>
</#macro>