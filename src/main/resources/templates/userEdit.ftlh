<#import "parts/common.ftlh" as c>
<#import "parts/navigation.ftlh" as n>

<@c.page>
  <@n.navigation />
  <section class="object">
    <h2 class="title">Редактирование пользователя</h2>
    <div class="block_object">
      <div class="add_object">
        <form action="/user" method="post" class="form_object" align="center">
          <input type="text" name="username" value="${user.username}" class="inp_obj" required>
          <#list roles as role>
            <div>
              <label class="container">
                <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} class="check_role">${role}
              </label>
            </div>
          </#list>
          <input type="hidden" value="${user.id}" name="userId">
          <input type="hidden" value="${_csrf.token}" name="_csrf">
          <button type="submit" class="btn_obj">Сохранить</button>
        </form>
      </div>
    </div>    
  </section>
</@c.page>