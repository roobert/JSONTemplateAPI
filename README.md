# JSONTemplateAPI

## About

Post JSON to an API which can be used in templates that are then commited to a git repo.

## Configuration

```
# checkout repo
git clone https://github.com/roobert/HieraNodeAPI

# create remote repo to store remote hiera data
cd HieraNodeAPI/data
git init
echo "# hiera node repo" > README.md
git add README.md
git commit -m 'initial commit'
git remote add origin <upstream>
git push -u origin master
```

## Run

```
rackup
```

## Test

```
curl localhost:7399/server/add -XPOST -d '{ "vlan": 11, "last_octet": "200", "filename": "my.node.example.yaml", "template": "node.yaml.erb"  }' -H 'Content-Type: application/json'
```
