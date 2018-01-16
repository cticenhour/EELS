k0 = 0.4189
E0 = 1
k_x = 0.2771
k_y = 0.3142

[Mesh]
  file = '../meshes/waveguide_2408.msh'
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

[NodalNormals]
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
    type = NORMALTEST
    variable = Re_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_real]
    type = NORMALTEST
    boundary = bottom
    variable = Re_E_z
    value = 0
  [../]
  [./port_real]
    type = PortBC
    boundary = port
    variable = Re_E_z
    num_type = real
    k = ${k_x}
    coupled_var = Im_E_z
    incoming_wave_fxn = E_inc_imag
  [../]
  [./absorber_real]
    type = AbsorbingBC
    boundary = exit
    variable = Re_E_z
    k = ${k_x}
    num_type = real
    coupled_var = Im_E_z
  [../]
  [./top_imag]
    type = NORMALTEST
    variable = Im_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_imag]
    type = NORMALTEST
    boundary = bottom
    variable = Im_E_z
    value = 0
  [../]
  [./port_imag]
    type = PortBC
    boundary = port
    variable = Im_E_z
    num_type = imaginary
    k = ${k_x}
    coupled_var = Re_E_z
    incoming_wave_fxn = E_inc_real
  [../]
  [./absorber_imag]
    type = AbsorbingBC
    boundary = exit
    variable = Im_E_z
    k = ${k_x}
    num_type = imaginary
    coupled_var = Re_E_z
  [../]
[]

[Functions]
  [./E_inc_real]
    type = ParsedFunction
    value = '${E0} * sin(pi * y / 10)'
  [../]
  [./E_inc_imag]
    type = ParsedFunction
    value = '0'
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
    #ksp_norm = none     # required if ksp_type=preonly
  [../]
[]

[Executioner]
  type = Steady
  solve_type =  'PJFNK'
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
  #petsc_options_iname = '-pc_type -ksp_type'
  #petsc_options_value = 'lu preonly'
  nl_rel_tol = 1e-7
  nl_max_its = 400
[]

[Debug]
  show_var_residual_norms = false
[]

[Outputs]
  print_perf_log = false
  print_linear_residuals = true
  [./out]
    type = Exodus
  [../]
[]
