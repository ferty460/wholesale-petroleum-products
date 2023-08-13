<#import "login.ftlh" as l>

<#include "security.ftlh">

<#macro navigation>
    <header>
        <a href="/" class="logo">ГНП сеть</a>
        <nav class="navigation">
            <ul class="menu">
                <#if isAdmin>
                <li class="menu_item"><a href="#">Адм панель</a>
                    <ul class="menu1">
                        <li class="menu_item1">
                            <a href="/product" class="menu_link">Список товаров</a>
                        </li>
                        <li class="menu_item1">
                            <a href="/user" class="menu_link">Список пользователей</a>
                        </li>
                    </ul>
                </li>
                </#if>
                <#if isLogged>
                <li class="menu_item"><a href="#">Мой профиль</a>
                    <ul class="menu1">
                        <li class="menu_item1">
                            <a href="/main" class="menu_link">Мои заказы</a>
                        </li>
                        <li class="menu_item1">
                            <a href="/object" class="menu_link">Мои объекты</a>
                        </li>
                        <li class="menu_item1">
                            <a href="/help" class="menu_link">Помощь</a>
                        </li>
                        <li class="menu_item1">
                            <@l.logout />
                        </li>
                    </ul>
                </li>
                </#if>
            </ul>
        </nav>
    </header>
</#macro>