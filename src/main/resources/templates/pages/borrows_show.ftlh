<#import "/spring.ftl" as spring />


<html>
<head>
    <title>Borrows</title>
    <#include "../partials/head.ftlh">
</head>
<body>


<#assign page = "Borrows">
<#include "../partials/main_content_top.ftlh">

    <h3 class="mb-3">Borrows</h3>
    <div class="table-responsive">
        <#include "../partials/borrows_table.ftlh" />
    </div>


<!-- Modal -->
<#include "../partials/delete_confirm_modal.ftlh" />


<#include "../partials/main_content_bottom.ftlh">
<#include "../partials/scripts.ftlh">
<script src="/scripts/main.js"></script>
</body>
</html>

