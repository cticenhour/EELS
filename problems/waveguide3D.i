k0 = 0.4189
E0 = 1
k_x = 0.1571
k_y = 0.3142
k_z = 0.2282
h_squared = 0.1234
beta = 0.2282

[Mesh]
  file = '../meshes/waveguide3D.msh'
[]

[Variables]
  [./Re_E_x]
    order = FIRST
    family = LAGRANGE
  [../]
  [./Im_E_x]
    order = FIRST
    family = LAGRANGE
  [../]
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
  #[./graddiv_real_x]
  #  type = GradDiv
  #  dimension = 0
  #  Field_0 = Re_E_x
  #  Field_1 = Re_E_y
  #  Field_2 = Re_E_z
  #  variable = Re_E_x
  #[../]
  [./laplacian_real_x]
    type = Diffusion
    variable = Re_E_x
  [../]
  [./linear_real_x]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_x
  [../]
  #[./graddiv_imag_x]
  #  type = GradDiv
  #  dimension = 0
  #  Field_0 = Im_E_x
  #  Field_1 = Im_E_y
  #  Field_2 = Im_E_z
  #  variable = Im_E_y
  #[../]
  [./laplacian_imag_x]
    type = Diffusion
    variable = Im_E_x
  [../]
  [./linear_imag_x]
    type = CoeffField
    coefficient = ${k0}
    variable = Im_E_x
  [../]
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
  [./port_real_x]
    type = PortBC
    boundary = port
    variable = Re_E_x
    num_type = real
    k = ${k_z}
    coupled_var = Im_E_x
    incoming_wave_fxn = E_inc_imag_x
  [../]
  [./absorber_real_x]
    type = AbsorbingBC
    boundary = exit
    variable = Re_E_x
    k = ${k_z}
    num_type = real
    coupled_var = Im_E_x
  [../]
  [./top_real_x]
    type = DirichletBC
    boundary = top
    variable = Re_E_x
    value = 0
  [../]
  [./bottom_real_x]
    type = DirichletBC
    boundary = bottom
    variable = Re_E_x
    value = 0
  [../]
  [./port_imag_x]
    type = PortBC
    boundary = port
    variable = Im_E_x
    num_type = imaginary
    k = ${k_z}
    coupled_var = Re_E_x
    incoming_wave_fxn = E_inc_real_x
  [../]
  [./absorber_imag_x]
    type = AbsorbingBC
    boundary = exit
    variable = Im_E_x
    k = ${k_z}
    num_type = imaginary
    coupled_var = Re_E_x
  [../]
  [./top_imag_x]
    type = DirichletBC
    boundary = top
    variable = Im_E_x
    value = 0
  [../]
  [./bottom_imag_x]
    type = DirichletBC
    boundary = bottom
    variable = Im_E_x
    value = 0
  [../]
  [./port_real_y]
    type = PortBC
    boundary = port
    variable = Re_E_y
    num_type = real
    k = ${k_z}
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
  [./left_real_y]
    type = DirichletBC
    boundary = left
    variable = Re_E_y
    value = 0
  [../]
  [./right_real_y]
    type = DirichletBC
    boundary = right
    variable = Re_E_y
    value = 0
  [../]
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
  [./left_imag_y]
    type = DirichletBC
    boundary = left
    variable = Im_E_y
    value = 0
  [../]
  [./right_imag_y]
    type = DirichletBC
    boundary = right
    variable = Im_E_y
    value = 0
  [../]
  #[./walls_real_z]
  #  type = DirichletBC
  #  variable = Re_E_z
  #  boundary = walls
  #  value = 0
  #[../]
  [./top_real_z]
    type = DirichletBC
    variable = Re_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_real_z]
    type = DirichletBC
    variable = Re_E_z
    boundary = bottom
    value = 0
  [../]
  [./left_real_z]
    type = DirichletBC
    variable = Re_E_z
    boundary = left
    value = 0
  [../]
  [./right_real_z]
    type = DirichletBC
    variable = Re_E_z
    boundary = right
    value = 0
  [../]
  [./port_real_z]
    type = PortBC
    boundary = port
    variable = Re_E_z
    num_type = real
    k = ${k_z}
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
  #[./walls_imag_z]
  #  type = DirichletBC
  #  variable = Im_E_z
  #  boundary = walls
  #  value = 0
  #[../]
  [./top_imag_z]
    type = DirichletBC
    variable = Im_E_z
    boundary = top
    value = 0
  [../]
  [./bottom_imag_z]
    type = DirichletBC
    variable = Im_E_z
    boundary = bottom
    value = 0
  [../]
  [./left_imag_z]
    type = DirichletBC
    variable = Im_E_z
    boundary = left
    value = 0
  [../]
  [./right_imag_z]
    type = DirichletBC
    variable = Im_E_z
    boundary = right
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
  [./E_inc_real_x]
    type = ParsedFunction
    value = '0'
  [../]
  [./E_inc_imag_x]
    type = ParsedFunction
    value = '-${beta} * (${k_x} / ${h_squared}) * ${E0} * cos(${k_x} * x) * sin(${k_y} * y)'
  [../]
  [./E_inc_real_y]
    type = ParsedFunction
    value = '0'
  [../]
  [./E_inc_imag_y]
    type = ParsedFunction
    value = '-${beta} * (${k_y} / ${h_squared}) * ${E0} * sin(${k_x} * x) * cos(${k_y} * y)'
  [../]
  [./E_inc_real_z]
    type = ParsedFunction
    value = '${E0} * sin(${k_y} * y) * sin(${k_x} * x)'
  [../]
  [./E_inc_imag_z]
    type = ParsedFunction
    value = '0'
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
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
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
