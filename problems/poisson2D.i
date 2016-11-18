[Mesh]
  file = 'box.e' #placeholder
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./laplacian]
    type = Diffusion
    variable = u
  [../]
  [./RHS]
    type = BodyForce
    function = 1
  [../]
[]

[BCs]
  [./top]
    type = DirichletBC
    boundary = top
    value = 0
  [../]
  [./bottom]
    type = DirichletBC
    boundary = bottom
    value = 0    
  [../]
  [./left]
    type = DirichletBC
    boundary = left
    value = 0
  [../]
  [./right]
    type = DirichletBC
    boundary = right
    value = 0
  [../]
[]
