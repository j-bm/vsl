module main

import vsl.iter

data := [1.0, 2.0, 3.0]
r := 3
mut combs := iter.new_combinations_iter(data, r)
for comb in combs {
	print(comb)
}
