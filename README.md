# ManageIQ role creation script
This sctipt creates `EvmRole-intersight_user` and `EvmRole-intersight_admin` roles automatically.

## Installation

`bundle install` to install the needed gems

## Usage

```
miq-role-create.rb --username username --password password --url url
    -u, --username USERNAME          [Mandatory] ManageIQ username
    -p, --password PASSWORD          [Mandatory] ManageIQ password
        --url URL                    [Mandatory] URL to the ManageIQ API
```
