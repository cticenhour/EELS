k0 = 0.4189
E0 = 1
k_y = 0.3142

[Mesh]
  file = '../meshes/waveguide.msh'
[]

[Variables]
  [./Re_E_z]
    order = FIRST
    family = LAGRANGE
  [../]
  [./Im_E_z]
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
  [./E_mag]
    order = FIRST
    family = LAGRANGE
  [../]
  [./E_phase]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./laplacian_real]
    type = Diffusion
    variable = Re_E_z
  [../]
  [./linear_real]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_z
  [../]
  [./laplacian_imag]
    type = Diffusion
    variable = Im_E_z
  [../]
  [./linear_imag]
    type = CoeffField
    coefficient = ${k0}
    variable = Im_E_z
  [../]
[]

[AuxKernels]
  [./magnitude]
    type = FieldMagnitude
    variable = E_mag
    coupled_real = Re_E_z
    coupled_imag = Im_E_z
  [../]
  [./phase]
    type = WavePhase
    variable = E_phase
    coupled_real = Re_E_z
    coupled_imag = Im_E_z
  [../]
[]

[BCs]
  [./top_real]
    type = DirichletBC
    variable = Re_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_real]
    type = DirichletBC
    boundary = bottom
    variable = Re_E_z
    value = 0
  [../]
  [./port_real]
    type = PortBC
    boundary = port
    variable = Re_E_z
    num_type = real
    k = ${k0};
    coupled_var = Im_E_z
    incoming_wave_fxn = E_inc_real
  [../]
  [./absorber_real] # second order if k_perp is provided, first otherwise
    type = AbsorbingBC
    boundary = exit
    variable = Re_E_z
    k = ${k0}
    k_perp = ${k_y}
    num_type = real
    coupled_var = Im_E_z
  [../]
  [./top_imag]
    type = DirichletBC
    variable = Im_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_imag]
    type = DirichletBC
    boundary = bottom
    variable = Im_E_z
    value = 0
  [../]
  [./port_imag]
    type = PortBC
    boundary = port
    variable = Im_E_z
    num_type = imaginary
    k = ${k0}
    coupled_var = Re_E_z
    incoming_wave_fxn = E_inc_imag
  [../]
  [./absorber_imag] # second order if k_perp is provided, first otherwise
    type = AbsorbingBC
    boundary = exit
    variable = Im_E_z
    k = ${k0}
    k_perp = ${k_y}
    num_type = imaginary
    coupled_var = Re_E_z
  [../]
[]

[Functions]
  [./E_inc_real]
    type = ParsedFunction
    value = '${E0} * sin(pi * y / 10) * cos(-${k0} * x)'
  [../]
  [./E_inc_imag]
    type = ParsedFunction
    value = '${E0} * sin(pi * y / 10) * sin(-${k0} * x)'
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
