gitrepo=https://github.com/Microsoft/TailwindTraders
webappname=challenge1-app-service

az webapp deployment source config --name $webappname --resource-group challenge1 --repo-url $gitrepo --branch master --manual-integration

az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/ddb45f69-d4fe-4d69-b32e-262360763207
/resourceGroups/challenge1/providers/Microsoft.Web/sites/challenge1-app-service
