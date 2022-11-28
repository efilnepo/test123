# Examples for ansible

## File structure

```
.
├── example1        # Most simple way with one file only
│   ├── main.yaml
│   └── run.sh
├── example2        # Example with separate file for variables
│   ├── main.yaml
│   ├── run.sh
│   └── vars.yaml
└── example3        # Example with using inventory file and group_vars
│   ├── group_vars
│   │   └── group_a
│   │       └── anyname.yaml
│   ├── hosts.yaml
│   ├── main.yaml
│   └── run.sh
└── example4        # Same as example3 but with using role
    ├── group_vars
    │   └── group_a
    │       └── anyname.yaml
    ├── hosts.yaml
    ├── main.yaml
    ├── roles
    │   └── role_a
    │       └── tasks
    │           └── main.yaml
    └── run.sh


❯ tree

```

## How to use

```
dir=$(pwd)

cd $dir/example1
./run.sh

cd $dir/example2
./run.sh

cd $dir/example3
./run.sh

cd $dir/example4
./run.sh
```
