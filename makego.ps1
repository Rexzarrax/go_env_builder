#####################################################
# Based on 
# https://github.com/golang-standards/project-layout
#####################################################

md .\cmd  -ErrorAction Continue; Write-Host '.\cmd alread exists'
New-Item -Path '.\cmd\main.go' -ItemType File -ErrorAction Continue; Write-Host '.\cmd\main.go alread exists'

projectName = Read-Host "Please Enter the project name: "

Add-Content .\cmd\main.go 'package main

import (
    "fmt"
)

var VERSION string = 0.1
var PROJECTNAME = "'$projectName'"

func main() {
    fmt.Printf("%s %s ", PROJECTNAME, VERSION)
}
';
md .\internal -ErrorAction Continue; Write-Host '.\internal alread exists'
md .\pkg -ErrorAction Continue; Write-Host '.\pkg alread exists'
md .\configs -ErrorAction Continue; Write-Host '.\configs alread exists'
md .\docs -ErrorAction Continue; Write-Host '.\docs alread exists'

go run '.\cmd\main.go'

go mod init $projectName

go mod tidy