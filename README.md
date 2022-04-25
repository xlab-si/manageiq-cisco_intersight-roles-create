# ManageIQ role creation script
This sctipt creates `intersight_user` (`EvmRole-intersight_user`, `EvmGroup-intersight_user`, `EvmUser-intersight_user`) and `intersight_admin` (`EvmRole-intersight_admin`, `EvmGroup-intersight_admin`, `EvmUser-intersight_admin`) automatically.

## Installation

`bundle install` to install the needed gems

## Usage

Currently, both users are created automatically. If you want to create specific user, you have to comment method call on one of the last two lines [in this file](https://github.com/timrekelj/miq-role-create/blob/master/miq-role-create.rb)

```
ruby miq-role-create.rb --username username --password password --url url
    -u, --username USERNAME          [Mandatory] ManageIQ username
    -p, --password PASSWORD          [Mandatory] ManageIQ password
        --url URL                    [Mandatory] URL to the ManageIQ API
```
