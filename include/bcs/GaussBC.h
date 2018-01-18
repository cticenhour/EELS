#ifndef GAUSSBC_H
#define GAUSSBC_H

#include "NodalNormalBC.h"

class GaussBC;

template<>
InputParameters validParams<GaussBC>();

/**
 *
 */
class GaussBC : public NodalNormalBC
{
public:
  GaussBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

private:

  const VariableValue & _field_0;

  const VariableValue & _field_1;

  const VariableValue & _field_2;
  //
  // Real _dir;
  //
  // Real _rhos;
  //
  // Real _eps;

};

#endif // GAUSSBC_H
