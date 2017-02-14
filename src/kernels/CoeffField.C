#include "CoeffField.h"

template <> InputParameters validParams<CoeffField>() {
  InputParameters params = validParams<Reaction>();
  params.addRequiredParam<Real>("coefficient", "Coefficient multiplier for field.");
  return params;
}

CoeffField::CoeffField(const InputParameters & parameters)
    : Reaction(parameters),

      _coefficient(getParam<Real>("coefficient"))

{}

Real CoeffField::computeQpResidual() {
  return -_coefficient * _coefficient * Reaction::computeQpResidual();
}

Real CoeffField::computeQpJacobian() {
  return -_coefficient * _coefficient * Reaction::computeQpJacobian();
}
