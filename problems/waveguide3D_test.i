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

[NodalNormals]
[]

[Kernels]
  [./laplacian_real_x]
    type = Diffusion
    variable = Re_E_x
  [../]
  [./linear_real_x]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_x
  [../]
  [./laplacian_imag_x]
    type = Diffusion
    variable = Im_E_x
  [../]
  [./linear_imag_x]
    type = CoeffField
    coefficient = ${k0}
    variable = Im_E_x
  [../]
  [./laplacian_real_y]
    type = Diffusion
    variable = Re_E_y
  [../]
  [./linear_real_y]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_y
  [../]
  [./laplacian_imag_y]
    type = Diffusion
    variable = Im_E_y
  [../]
  [./linear_imag_y]
    type = CoeffField
    coefficient = ${k0}
    variable = Im_E_y
  [../]
  [./laplacian_real_z]
    type = Diffusion
    variable = Re_E_z
  [../]
  [./linear_real_z]
    type = CoeffField
    coefficient = ${k0}
    variable = Re_E_z
  [../]
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
  [./Gauss_real_x_left]
    type = GaussBC
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'left'
  [../]
  [./Gauss_real_x_right]
    type = GaussBC
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'right'
  [../]
  [./Gauss_real_x_top]
    type = GaussBC
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'top'
  [../]
  [./Gauss_real_x_bottom]
    type = GaussBC
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'bottom'
  [../]
  [./PEC_real_x_left]
    type = PEC2
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'left'
  [../]
  [./PEC_real_x_right]
    type = PEC2
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'right'
  [../]
  [./PEC_real_x_top]
    type = PEC2
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'top'
  [../]
  [./PEC_real_x_bottom]
    type = PEC2
    variable = Re_E_x
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'bottom'
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
  [./Gauss_imag_x_left]
    type = GaussBC
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'left'
  [../]
  [./Gauss_imag_x_right]
    type = GaussBC
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'right'
  [../]
  [./Gauss_imag_x_top]
    type = GaussBC
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'top'
  [../]
  [./Gauss_imag_x_bottom]
    type = GaussBC
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'bottom'
  [../]
  [./PEC_imag_x_left]
    type = PEC2
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'left'
  [../]
  [./PEC_imag_x_right]
    type = PEC2
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'right'
  [../]
  [./PEC_imag_x_top]
    type = PEC2
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'top'
  [../]
  [./PEC_imag_x_bottom]
    type = PEC2
    variable = Im_E_x
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'bottom'
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
  [./Gauss_real_y_left]
    type = GaussBC
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'left'
  [../]
  [./Gauss_real_y_right]
    type = GaussBC
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'right'
  [../]
  [./Gauss_real_y_top]
    type = GaussBC
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'top'
  [../]
  [./Gauss_real_y_bottom]
    type = GaussBC
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'bottom'
  [../]
  [./PEC_real_y_left]
    type = PEC2
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'left'
  [../]
  [./PEC_real_y_right]
    type = PEC2
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'right'
  [../]
  [./PEC_real_y_top]
    type = PEC2
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'top'
  [../]
  [./PEC_real_y_bottom]
    type = PEC2
    variable = Re_E_y
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'bottom'
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
  [./Gauss_imag_y_left]
    type = GaussBC
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'left'
  [../]
  [./Gauss_imag_y_right]
    type = GaussBC
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'right'
  [../]
  [./Gauss_imag_y_top]
    type = GaussBC
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'top'
  [../]
  [./Gauss_imag_y_bottom]
    type = GaussBC
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'bottom'
  [../]
  [./PEC_imag_y_left]
    type = PEC2
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'left'
  [../]
  [./PEC_imag_y_right]
    type = PEC2
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'right'
  [../]
  [./PEC_imag_y_top]
    type = PEC2
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'top'
  [../]
  [./PEC_imag_y_bottom]
    type = PEC2
    variable = Im_E_y
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'bottom'
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
  [./Gauss_real_z_left]
    type = GaussBC
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'left'
  [../]
  [./Gauss_real_z_right]
    type = GaussBC
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'right'
  [../]
  [./Gauss_real_z_top]
    type = GaussBC
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'top'
  [../]
  [./Gauss_real_z_bottom]
    type = GaussBC
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'bottom'
  [../]
  [./PEC_real_z_left]
    type = PEC2
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'left'
  [../]
  [./PEC_real_z_right]
    type = PEC2
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'right'
  [../]
  [./PEC_real_z_top]
    type = PEC2
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'top'
  [../]
  [./PEC_real_z_bottom]
    type = PEC2
    variable = Re_E_z
    Field_0 = Re_E_x
    Field_1 = Re_E_y
    Field_2 = Re_E_z
    boundary = 'bottom'
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
  [./Gauss_imag_z_left]
    type = GaussBC
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'left'
  [../]
  [./Gauss_imag_z_right]
    type = GaussBC
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'right'
  [../]
  [./Gauss_imag_z_top]
    type = GaussBC
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'top'
  [../]
  [./Gauss_imag_z_bottom]
    type = GaussBC
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'bottom'
  [../]
  [./PEC_imag_z_left]
    type = PEC2
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'left'
  [../]
  [./PEC_imag_z_right]
    type = PEC2
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'right'
  [../]
  [./PEC_imag_z_top]
    type = PEC2
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'top'
  [../]
  [./PEC_imag_z_bottom]
    type = PEC2
    variable = Im_E_z
    Field_0 = Im_E_x
    Field_1 = Im_E_y
    Field_2 = Im_E_z
    boundary = 'bottom'
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

[Preconditioning]
  [./FDP]
    type = FDP
    pc_side = 'left'
    full = true
    ksp_norm = preconditioned
  [../]
[]

[Executioner]
  type = Steady
  solve_type =  'PJFNK'
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu NONZERO'
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
  [./out_linear]
    type = Exodus
    execute_on = 'linear'
  [../]
[]
