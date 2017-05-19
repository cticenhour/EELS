k0 = 0.4189
E0 = 1
k_z = 0.2771
k_y = 0.3142

[Mesh]
  file = '../meshes/waveguide_2408.msh'
[]

[Variables]
  [./Re_E_y]
    order = FIRST
    family = LAGRANGE
  [../]
  [./Im_E_y]
    order = FIRST
    family = LAGRANGE
  [../]
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
  [./y]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./y_node]
  [../]
  [./z]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./z_node]
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
  #[./graddiv_real_y]
  #  type = GradDiv
  #  dimension = 1
  #  Field_0 = 0
  #  Field_1 = Re_E_y
  #  Field_2 = Re_E_z
  #  variable = Re_E_y
  #[../]
  [./laplacian_real_y]
    type = Diffusion
    variable = Re_E_y
  [../]
  [./linear_real_y]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_y
  [../]
  #[./graddiv_imag_y]
  #  type = GradDiv
  #  dimension = 1
  #  Field_0 = 0
  #  Field_1 = Im_E_y
  #  Field_2 = Im_E_z
  #  variable = Im_E_y
  #[../]
  [./laplacian_imag_y]
    type = Diffusion
    variable = Im_E_y
  [../]
  [./linear_imag_y]
    type = CoeffField
    coefficient = ${k0}
    variable = Im_E_y
  [../]
  #[./graddiv_real_z]
  #  type = GradDiv
  #  dimension = 2
  #  Field_0 = 0
  #  Field_1 = Re_E_y
  #  Field_2 = Re_E_z
  #  variable = Re_E_z
  #[../]
  [./laplacian_real_z]
    type = Diffusion
    variable = Re_E_z
  [../]
  [./linear_real_z]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_z
  [../]
  #[./graddiv_imag_z]
  #  type = GradDiv
  #  dimension = 2
  #  Field_0 = 0
  #  Field_1 = Im_E_y
  #  Field_2 = Im_E_z
  #  variable = Im_E_z
  #[../]
  [./laplacian_imag_z]
    type = Diffusion
    variable = Im_E_z
  [../]
  [./linear_imag_z]
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
  #[./top_real_y]
  #  type = DirichletBC
  #  variable = Re_E_y
  #  boundary = top
  #  value = 0
  #[../]
  #[./bottom_real_y]
  #  type = DirichletBC
  #  boundary = bottom
  #  variable = Re_E_y
  #  value = 0
  #[../]
  [./port_real_y]
    type = PortBC
    boundary = port
    variable = Re_E_y
    num_type = real
    k = ${k_z};
    coupled_var = Im_E_y
    incoming_wave_fxn = E_inc_imag_y
  [../]
  [./absorber_real_y]
    type = AbsorbingBC
    boundary = exit
    variable = Re_E_y
    k = ${k_z}
    num_type = real
    coupled_var = Im_E_y
  [../]
  #[./top_imag_y]
  #  type = DirichletBC
  #  variable = Im_E_y
  #  boundary = top
  #  value = 0
  #[../]
  #[./bottom_imag_y]
  #  type = DirichletBC
  #  boundary = bottom
  #  variable = Im_E_y
  #  value = 0
  #[../]
  [./port_imag_y]
    type = PortBC
    boundary = port
    variable = Im_E_y
    num_type = imaginary
    k = ${k_z}
    coupled_var = Re_E_y
    incoming_wave_fxn = E_inc_real_y
  [../]
  [./absorber_imag_y]
    type = AbsorbingBC
    boundary = exit
    variable = Im_E_y
    k = ${k_z}
    num_type = imaginary
    coupled_var = Re_E_y
  [../]
  [./top_real_z]
    type = DirichletBC
    variable = Re_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_real_z]
    type = DirichletBC
    boundary = bottom
    variable = Re_E_z
    value = 0
  [../]
  [./port_real_z]
    type = PortBC
    boundary = port
    variable = Re_E_z
    num_type = real
    k = ${k_z};
    coupled_var = Im_E_z
    incoming_wave_fxn = E_inc_imag_z
  [../]
  [./absorber_real_z]
    type = AbsorbingBC
    boundary = exit
    variable = Re_E_z
    k = ${k_z}
    num_type = real
    coupled_var = Im_E_z
  [../]
  [./top_imag_z]
    type = DirichletBC
    variable = Im_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_imag_z]
    type = DirichletBC
    boundary = bottom
    variable = Im_E_z
    value = 0
  [../]
  [./port_imag_z]
    type = PortBC
    boundary = port
    variable = Im_E_z
    num_type = imaginary
    k = ${k_z}
    coupled_var = Re_E_z
    incoming_wave_fxn = E_inc_real_z
  [../]
  [./absorber_imag_z]
    type = AbsorbingBC
    boundary = exit
    variable = Im_E_z
    k = ${k_z}
    num_type = imaginary
    coupled_var = Re_E_z
  [../]
[]

[Functions]
  [./E_inc_real_z]
    type = ParsedFunction
    value = '${E0} * sin(pi * y / 10)'
  [../]
  [./E_inc_imag_z]
    type = ParsedFunction
    value = '0'
  [../]
  [./E_inc_real_y]
    type = ParsedFunction
    value = '0'
  [../]
  [./E_inc_imag_y]
    type = ParsedFunction
    value = '-${E0} * (${k_z} / ${k_y}) * cos(${k_y} * y)'
  [../]
[]

#[Preconditioning]
#  [./SMP]
#    type = SMP
#    full = true
#  [../]
#[]

[Executioner]
  type = Steady
  solve_type =  'PJFNK'
  petsc_options_iname = '-pc_type -ksp_type'
  petsc_options_value = 'lu none'
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
