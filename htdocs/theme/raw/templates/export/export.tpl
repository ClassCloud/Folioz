{include file="header.tpl"}
<div id="exportgeneration">
    <h3>{str tag=pleasewaitwhileyourexportisbeinggenerated section=export}</h3>
    <iframe src="{$WWWROOT}export/download.php" id="progress-iframe"></iframe>
</div>
{include file="footer.tpl"}
