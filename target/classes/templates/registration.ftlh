<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<#import "parts/navigation.ftlh" as n>

<@c.page>
    <@n.navigation />
    <div class="background">
        <section class="login">
            <h2 class="title">Регистрация</h2>
            <div class="block_login" align="center">
                ${message?ifExists}
                <@l.login "/registration" />
                <div class="add_user">
                    <p class="or">или</p>
                    <a class="reg" href="/login">Вход</a>
                </div>
            </div>
        </section>
    </div>
</@c.page>