<#import "parts/common.ftlh" as c>
<#import "parts/navigation.ftlh" as n>

<@c.page>
    <@n.navigation />
    <section class="object">
        <h2 class="title">Товары</h2>
        <div class="block_object">
            <div class="add_object">
                <h3 class="subtitle">Новый товар</h3>
                <form method="post" class="form_object" align="center">
                    <input type="text" name="name" placeholder="Наименование" class="inp_obj" required>
                    <input type="text" name="cost" placeholder="Стоимость" pattern="^[0-9]+$" class="inp_obj" required>
                    <input type="text" name="measure" placeholder="Ед. изм." class="inp_obj" required>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn_obj">Добавить</button>
                </form>
            </div>
        
            <div class="show_object">
                <h3 class="subtitle">Товары:</h3>
                <table align="center" class="table_object">
                    <thead>
                        <tr>
                            <th class="table_head">Наименование</th>
                            <th class="table_head">Стоимость</th>
                            <th class="table_head">Ед. изм</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list products as product>
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.cost}</td>
                            <td>${product.measure}</td>
                        </tr>
                        <#else>
                            Товаров нет
                        </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</@c.page>
