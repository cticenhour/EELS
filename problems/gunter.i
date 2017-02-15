[Mesh]
  file = '../meshes/gunter_box.msh'
[]

[Variables]
  [./T]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[AuxVariables]
  [./x]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./x_node]
  [../]
  [./y]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./y_node]
  [../]
[]

[Kernels]

[]

[AuxKernels]

[]

[BCs]

[]

[Functions]

[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Debug]
  show_var_residual_norms = true
[]

[Outputs]
  print_perf_log = true
  print_linear_residuals = false
  [./out]
    type = Exodus
  [../]
[]
