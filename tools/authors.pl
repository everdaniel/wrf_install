#!/usr/bin/env perl
# taken from http://github.com/magit/magit

# :-)

/(\d{4}).*?_(.+)/&&\$a{$2}->{$1}for`git log --pretty=format:%aD_%an`;
print"Copyright (C) ".join(", ",sort keys %{$a{$_}})." $_.\n"for sort keys %a
