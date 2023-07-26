$TenantId = '5c147d8a-3229-4a42-a54e-98b937904e15'
$SubID = 'bad8333d-60e3-47ec-884d-20456f2df201'
$RG = 'NE-vWAN-RG'
$Location = 'North Europe'
$Name = 'vWAN-LAB'
$TemplateFile = "C:\Users\michael.neal\OneDrive - Mehodge\Git\Arm-vWAN\azuredeploy.json"
$TemplateParameterFile = "C:\Users\michael.neal\OneDrive - Mehodge\Git\Arm-vWAN\azuredeploy.parameters.json"
$Tags = @{
    "Application" = "vWAN";
    "Data Classication" = "Internal";
    "Environment" = "POC";
    "Monitoring" = "PresMOff";
    "Owner" = "MNeal"
}

Connect-AzAccount -TenantId $TenantId -SubscriptionID $SubID

New-AzResourceGroup -Name $RG -Location $Location -Tag $Tags
New-AzResourceGroupDeployment `
    -Name $Name `
    -ResourceGroupName $RG `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $TemplateParameterFile