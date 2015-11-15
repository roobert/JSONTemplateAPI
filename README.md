# json_template_api

## About

Post JSON to an API which can be used in templates that are then commited to a git repo.

## Install Dependencies

```
gem install grape rack erubis git yaml thin
```

## Configuration

```
# checkout repo
git clone https://github.com/roobert/json_template_api /opt/json_template_api

# create remote repo to store remote hiera data
cd /opt/json_template_api/data
git init
echo "# hiera node repo" > README.md
git add README.md
git commit -m 'initial commit'
git remote add origin <upstream>
git push -u origin master
```

## Run

```
thin --config thin.yml
```

## Test

```
curl localhost:7399/server/add -XPOST -H 'Content-Type: application/json' -d \
  '{ "vlan": 11,
     "last_octet": "200",
     "filename": "my.node.example.yaml",
     "template": "node.yml.erb" }'
```
