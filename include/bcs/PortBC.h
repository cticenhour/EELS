#ifndef PORTBC_H
#define PORTBC_H

#include "IntegratedBC.h"

// Forward declarations
class PortBC;

template <> InputParameters validParams<PortBC>();

class PortBC : public IntegratedBC {
public:
  PortBC(const InputParameters &parameters);

protected:
  virtual Real computeQpResidual() override;

private:
  // The function being used as the incoming wave
  Function &_field_inc;

  const VariableValue &_coupled_var_val;

  // Wave number of forward-moving function
  Real _k; // Later, this needs to be a material property

  std::string _num_type;

  Real _sign;
};

#endif // PORTBC_H
