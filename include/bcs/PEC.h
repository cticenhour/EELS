#ifndef PEC_H
#define PEC_H

#include "IntegratedBC.h"

class PEC;

template <>
InputParameters validParams<PEC>();

class PEC : public IntegratedBC
{
public:
  PEC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

private:
  const VariableValue & _field_0;

  const VariableValue & _field_1;

  const VariableValue & _field_2;

  Real _dir;

  Real _penalty;
};

#endif // PEC_H
