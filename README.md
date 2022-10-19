# Setup
- Install Microsoft .NET Framework 4.6.1 Developer Pack
    - https://www.microsoft.com/en-us/download/confirmation.aspx?id=49978
- Replace game path in `SpaceEngineers.csproj` if not installed to default location
- (TODO shell script)
# Create new script
- Copy template/Template.cs to root directory
- Change filename
- Change namespace
- (TODO shell script)

# Deploy to game

## File Watcher
Automatic deployment when file change detected. Use one of the following commands:
- `./watch.ps1 <filename>`
- `Tasks: Run Task > watch`

## Manual
One-time deployment. Use one of the following commands:

- `./deploy.ps1 <filename>`
- `Tasks: Run Build Task` (ctrl + shift + b)
- `Tasks: Run Task > deploy`
