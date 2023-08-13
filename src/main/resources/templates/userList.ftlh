<#import "parts/common.ftlh" as c>
<#import "parts/navigation.ftlh" as n>

<@c.page>
    <@n.navigation />
    <section class="object">
        <h2 class="title">Список пользователей</h2>
        <div class="block_object">
            <div class="show_object">
                <table align="center" class="table_object">
                    <thead>
                        <tr>
                            <th class="table_head">Имя</th>
                            <th class="table_head">Роль</th>
                            <th class="table_head"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list users as user>
                            <tr>
                                <td>${user.username}</td>
                                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                                <td><a href="/user/${user.id}" class="link_obj">Редактировать</a></td>
                            </tr>
                        </#list>
                    <tbody>
                </table>
            </div>
        </div>
    </section>
</@c.page>