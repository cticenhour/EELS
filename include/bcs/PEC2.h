#ifndef PEC2_H
#define PEC2_H

#include "NodalNormalBC.h"

class PEC2;

template<>
InputParameters validParams<PEC2>();

/**
 *
 */
class PEC2 : public NodalNormalBC
{
public:
  PEC2(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

private:
  const VariableValue & _field_0;

  const VariableValue & _field_1;

  const VariableValue & _field_2;
};

#endif // PEC2_H
