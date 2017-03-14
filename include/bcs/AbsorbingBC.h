#ifndef ABSORBINGBC_H
#define ABSORBINGBC_H

#include "IntegratedBC.h"

// Forward declarations
class AbsorbingBC;

template<>
InputParameters validParams<AbsorbingBC>();

class AbsorbingBC : public IntegratedBC {
public:
  AbsorbingBC(const InputParameters &parameters);

protected:
  virtual Real computeQpResidual() override;

private:
  Real _k;

  const VariableValue &_coupled_field_var_val;

  Real _sign;

  std::string _num_type;
};

#endif // ABSORBINGBC_H
