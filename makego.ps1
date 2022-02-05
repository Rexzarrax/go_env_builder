#####################################################
# Based on 
# https://github.com/golang-standards/project-layout
#####################################################

md .\cmd  -ErrorAction Continue; Write-Host '.\cmd alread exists'
New-Item -Path '.\cmd\main.go' -ItemType File -ErrorAction Continue; Write-Host '.\cmd\main.go alread exists'
Add-Content .\cmd\main.go 'package main

	

import (
    "fmt"
)
	

func main() {
    fmt.Println("hello world")
}
';
md .\internal -ErrorAction Continue; Write-Host '.\internal alread exists'
md .\pkg -ErrorAction Continue; Write-Host '.\pkg alread exists'
md .\configs -ErrorAction Continue; Write-Host '.\configs alread exists'
md .\docs -ErrorAction Continue; Write-Host '.\docs alread exists'

go run '.\cmd\main.go'
$project_name = Read-Host -Prompt "Enter your project name: "


go mod init $project_name

go mod tidy
