# title


## Test-Kitchen

### Requirements

- Vagrant
- ruby

### setup for vagrant

```
gem install bundler --no-ri --no-rdoc
bundle install
Kitchen converge
```

### kitchen commands

- kitchen list
- kitchen converge
- kitchen destroy

#### Example

```
 $ kitchen converge
-----> Starting Kitchen (v1.2.1)
-----> Creating <default-centos-64>...
       Bringing machine 'default' up with 'virtualbox' provider...
       [default] Importing base box 'opscode-centos-6.4'...
       [default] Matching MAC address for NAT networking...
       [default] Setting the name of the VM...
       [default] Clearing any previously set forwarded ports...
       [default] Clearing any previously set network interfaces...
       [default] Preparing network interfaces based on configuration...
       [default] Forwarding ports...
       [default] -- 22 => 2222 (adapter 1)
       [default] Running 'pre-boot' VM customizations...
       [default] Booting VM...
       [default] Waiting for machine to boot. This may take a few minutes...

-- snip --
```
