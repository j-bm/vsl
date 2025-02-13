module main

import vsl.float.float64
import vsl.func
import vsl.plot
import vsl.roots
import vsl.util
import math

const (
	epsabs = 0.0001
	epsrel = 0.00001
	n_max  = 100
)

fn f_cos(x f64, _ []f64) f64 {
	return math.cos(x)
}

f := func.new_func(f: f_cos)

mut solver := roots.new_bisection(f)

solver.xmin = 0.0
solver.xmax = 3.0
solver.epsabs = epsabs
solver.epsrel = epsrel
solver.n_max = n_max

result := solver.solve()?

expected := math.pi / 2.0
assert float64.soclose(result.x, expected, solver.epsabs)

println('x = ${result.x}')

mut plt := plot.new_plot()

x := util.lin_space(0.0, 3.0, 100)
y := x.map(f_cos(it, []f64{}))

plt.add_trace(
	trace_type: .scatter
	x: x
	y: y
	mode: 'lines'
	line: plot.Line{
		color: '#FF0000'
	}
)
plt.add_trace(
	trace_type: .scatter
	x: [result.x]
	y: [result.fx]
	mode: 'markers'
	marker: plot.Marker{
		color: ['#0000FF']
	}
)
plt.set_layout(
	title: 'cos(x)'
)
plt.show()!
