<#import "/spring.ftl" as spring />


<html>
<head>
    <title>Members</title>
    <#include "../partials/head.ftlh">
</head>
<body>


<#assign page = "User-Edit">
<#include "../partials/main_content_top.ftlh">

        <h3 class="mb-3">Edit User ${user.firstName} ${user.lastName}</h3>
        <div class="table-responsive">

            <#include "../forms/userEditForm.ftlh" />
        </div>

<#include "../partials/main_content_bottom.ftlh">
<#include "../partials/scripts.ftlh">
<script src="/scripts/userValidation.js"></script>
</body>
</html>

