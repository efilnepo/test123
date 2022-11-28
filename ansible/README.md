# Examples for ansible

```
❯ tree
.
├── example1        # Most simple way with one file only
│   ├── main.yaml
│   └── run.sh
├── example2        # Example with separate file for variables
│   ├── main.yaml
│   ├── run.sh
│   └── vars.yaml
└── example3        # Example with using inventory file and group_vars
    ├── group_vars
    │   └── group_a
    │       └── anyname.yaml
    ├── hosts.yaml
    ├── main.yaml
    └── run.sh

```
