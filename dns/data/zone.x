$ORIGIN vm.x.
$TTL 3600
@           IN SOA  vm.x. admin.vm.x. (
                    2022010100 ; serial
                    3H         ; refresh
                    1H         ; retry
                    1D         ; expire
                    1H )       ; TTL

@           IN A    10.21.248.107
*.vm.x.     IN A    10.21.248.107

