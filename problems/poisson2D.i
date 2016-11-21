[Mesh]
  file = '../meshes/box.msh'
[]

[Variables]
  [./u]
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
  [./]
[]

[Kernels]
  [./laplacian]
    type = Diffusion
    variable = u
  [../]
  [./RHS]
    type = BodyForce
    function = 1
    variable = u
  [../]
[]

[BCs]
  [./edge]
    type = DirichletBC
    variable = u
    boundary = edge
    value = 0
  [../]
#  [./top]
#    type = DirichletBC
#    boundary = 'top'
#    variable = u
#    value = 0
#  [../]
#  [./bottom]
#    type = DirichletBC
#    boundary = 'bottom'
#    variable = u
#    value = 0    
#  [../]
#  [./left]
#    type = DirichletBC
#    boundary = 'left'
#    variable = u
#    value = 0
#  [../]
#  [./right]
#    type = DirichletBC
#    boundary = 'right'
#    variable = u
#    value = 0
#  [../]
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
