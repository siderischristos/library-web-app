<#import "/spring.ftl" as spring />

<form action="/admin/borrows/create" id="borrowVal" name="borrowForm" method="POST">
    <div class="mb-3">
        <label for="date">Borrow Date</label>
        <@spring.bind "borrowForm.date"/>
        <input type="date" class="form-control" name="date" id="date" required value="<#if borrowForm.date?has_content>${borrowForm.date}</#if>">
        <#list spring.status.errorMessages as error>
            <span>${error}</span>
        </#list>
    </div>
    <div class="mb-3">
        <label for="returnDate">Return Date</label>
        <@spring.bind "borrowForm.returnDate"/>
        <input type="date" class="form-control" name="returnDate" id="returnDate" required value="<#if borrowForm.returnDate?has_content>${borrowForm.returnDate}</#if>">
        <#list spring.status.errorMessages as error>
            <span>${error}</span>
        </#list>
    </div>
    <div class="mb-3">
        <label for="status">Status</label>
        <@spring.bind "borrowForm.status"/>
        <select class="custom-select d-block w-100" name="status" id="status" required >
            <option value="" selected class="first-select-label">Choose Status</option>
            <option value="In Progress"   <#if borrowForm.status?has_content && borrowForm.status == "In Progress"> selected </#if>>
                In Progress
            </option>
            <option value="Completed"   <#if borrowForm.status?has_content && borrowForm.status == "Completed"> selected </#if>>
                Completed
            </option>
        </select>
        <#list spring.status.errorMessages as error>
            <span>${error}</span>
        </#list>

    </div>
    <div class="mb-3">
        <label for="bookPin">PIN</label>
        <@spring.bind "borrowForm.bookPin"/>
        <input type="text" class="form-control" name="bookPin" id="bookPin" placeholder="Book's PIN" value="<#if borrowForm.bookPin?has_content>${borrowForm.bookPin}</#if>">
        <#list spring.status.errorMessages as error>
            <span>${error}</span>
        </#list>
    </div>
    <div class="mb-3">
        <label for="bookTitle">Title</label>
        <@spring.bind "borrowForm.bookTitle"/>
        <input type="text" class="form-control" name="bookTitle" id="bookTitle" placeholder="Book's Title" value="<#if borrowForm.bookTitle?has_content>${borrowForm.bookTitle}</#if>">
        <#list spring.status.errorMessages as error>
            <span>${error}</span>
        </#list>
    </div>
    <div class="mb-3">
        <label for="membNumber">Membership Number</label>
        <@spring.bind "borrowForm.membNumber"/>
        <input type="text" class="form-control" name="membNumber" id="membNumber" placeholder="Membership Number" value="<#if borrowForm.membNumber?has_content>${borrowForm.membNumber}</#if>">
        <#list spring.status.errorMessages as error>
            <span>${error}</span>
        </#list>
    </div>

    <#if borrowCreateError?has_content>
        <div><p class="error">
                ${borrowCreateError}
            </p>
        </div>
    </#if>

    <button class="btn btn-primary btn-lg mt-4" type="submit">Borrow</button>
</form>
