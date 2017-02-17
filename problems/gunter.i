x0 = 0    # closed field line case
y0 = 0

#x0 = -0.5   # open field line case
#y0 = -0.5

[Mesh]
  file = '../meshes/gunter_box.msh'
[]

[Variables]
  [./temp]
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
  [./temp_analytic]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./conduction]
    type = HeatConduction
    variable = temp
  [../]
  [./Q]   # volumetric heat source term
    type = HeatSource
    variable  = temp
    value = 0.0
  [../]
[]

[AuxKernels]
  [./analytic_func]
    type = FunctionAux
    variable = temp_analytic
    function = T_analytic
  []
[]

[BCs]
  [./left]
    type = FunctionDirichletBC
    variable = temp
    boundary = left
    function =
  [../]
  [./right]
    type = FunctionDirichletBC
    variable = temp
    boundary = right
    function =
  [../]
  [./top]
    type = FunctionDirichletBC
    variable = temp
    boundary = top
    function =
  [../]
  [./bottom]
    type = FunctionDirichletBC
    variable = temp
    boundary = bottom
    function =
  [../]
[]

[Materials] # Do I need this??

[]

[Functions]
  [./T_analytic]
    type = ParsedFunction
    value = '1 - ((x - ${x0})^2 + (y - ${y0})^2)^(3/2)'
  [../]
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
