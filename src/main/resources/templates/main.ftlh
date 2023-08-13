<#import "parts/common.ftlh" as c>
<#import "parts/navigation.ftlh" as n>

<@c.page>
    <@n.navigation />
    <section class="order">
        <h2 class="title">Мои заказы</h2>
        <div class="block_order">
            <div class="add_order">
                <h3 class="subtitle_order">Новый заказ:</h3>
                <form method="post" name="myForm" align=center>
                    <label class="text_select">Выберите товар:</label><br>
                    <select name="product" class="select">
                        <#if products?has_content>
                            <#list products as product>
                                <option class="option" value="${product.id}">${product}</option>
                            </#list>
                            <#else>
                                <option class="option" value="">Товаров нет</option>
                        </#if>
                    </select><br>

                    <label class="text_select">Укажите количество:</label><br>
                    <input type="text" name="amount" placeholder="Количество" pattern="^[0-9]+$" class="inp_ord" required><br>
                    
                    <label class="text_select">Выберите место доставки:</label><br>
                    <select name="customerObject" class="select">
                        <#if products?has_content>
                            <#list objects as object>
                                <option class="option" value="${object.id}">${object.address}</option>
                            </#list>
                            <#else>
                                <option class="option" value="">Невозможно определить место доставки</option>
                        </#if>
                    </select><br>

                    <label class="text_select"><a class="link_obj" href="/object">Список объектов</a></label><br>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn_obj" type="submit">Добавить</button>
                </form>
            </div>
            <div class="show_order">
                <h3 class="subtitle_order">Заказы:</h3>
                <table>
                    <thead align="center">
                    <tr>
                        <th>Адрес</th>
                        <th>Товар</th>
                        <th>Дата и время</th>
                        <th>Общая стоимость</th>
                    </tr>
                    </thead>
                    <tbody align="center">
                    <#list orders as order>
                        <tr>
                            <td>${order.customerObject.address}</td>
                            <td>${order.product.name}</td>
                            <td>${order.time}</td>
                            <td>${order.totalCost} рублей</td>
                        </tr>
                        <#else>
                            Заказов нет
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</@c.page>