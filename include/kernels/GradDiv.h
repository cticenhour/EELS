#ifndef GRADDIV_H
#define GRADDIV_H

#include "Kernel.h"

class GradDiv;

template <>
InputParameters validParams<GradDiv>();

class GradDiv : public Kernel
{
public:
  GradDiv(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;

private:
  Real _dim;
  const VariableGradient & _field_0_grad;
  const VariableGradient & _field_1_grad;
  const VariableGradient & _field_2_grad;
};

#endif // GRADDIV_H
