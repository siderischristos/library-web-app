<table class="table table-striped table-sm">
    <thead>
    <tr>
        <th>Borrow Date</th>
        <th>Return Date</th>
        <th>Status</th>
        <th>Book's PIN</th>
        <th>Book's Title</th>
    </tr>
    </thead>
    <tbody>
    <#if userBorrows?has_content>
        <#list userBorrows as borrow>
            <tr>
                <td> ${borrow.date}</td>
                <td> ${borrow.returnDate}</td>
                <td> ${borrow.status}</td>
                <td> ${borrow.bookPin}</td>
                <td> ${borrow.bookTitle}</td>
            </tr>
        </#list>
    </#if>
    </tbody>
</table>