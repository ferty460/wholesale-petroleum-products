<#import "parts/common.ftlh" as c>
<#import "parts/navigation.ftlh" as n>

<@c.page>
    <@n.navigation />
    <section class="object">
        <h2 class="title">Мои объекты</h2>
        <div class="block_object">
            <div class="add_object">
                <h3 class="subtitle">Новый объект</h3>
                <form method="post" class="form_object" align="center">
                    <input type="text" name="name" placeholder="Наименование" class="inp_obj" required>
                    <input type="text" name="address" placeholder="Адрес" class="inp_obj" required>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn_obj">Добавить</button>
                </form>
            </div>
            
            <div class="show_object">
                <h3 class="subtitle">Объекты заказчика</h3>
                <div class="object_item object_h">
                    <span>Название</span>
                    <span>Адрес</span>
                </div>
                <#list customerObjects as customerObject>
                    <div class="object_item">
                        <span>${customerObject.name}</span>
                        <span>${customerObject.address}</span>
                    </div>
                    <#else>
                        Объектов нет
                </#list>
            </div>
        </div>
    </section>
</@c.page>