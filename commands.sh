gitrepo=https://github.com/Microsoft/TailwindTraders
webappname=challenge1-app-service

az webapp deployment source config --name $webappname --resource-group challenge1 --repo-url $gitrepo --branch master --manual-integration
