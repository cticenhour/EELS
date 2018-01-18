#include "GaussBC.h"

template<>
InputParameters validParams<GaussBC>()
{
  InputParameters params = validParams<NodalNormalBC>();
  params.addClassDescription("Gauss' Law BC for PEC surface, using NodalNormals system.");
  params.addRequiredCoupledVar("Field_0", "Coupled Field Variable, 0 direction");
  params.addRequiredCoupledVar("Field_1", "Coupled Field Variable, 1 direction");
  params.addRequiredCoupledVar("Field_2", "Coupled Field Variable, 2 direction");
  // params.addRequiredParam<Real>("direction","Field variable direction (0,1,2)");
  // params.addRequiredParam<Real>("charge_density", "Surface Charge Density, rho_s");
  // params.addRequiredParam<Real>("epsilon", "Permittivity");
  return params;
}

GaussBC::GaussBC(const InputParameters & parameters)
  : NodalNormalBC(parameters),

  _field_0(coupledValue("Field_0")),
  _field_1(coupledValue("Field_1")),
  _field_2(coupledValue("Field_2")) //,
  // _dir(getParam<Real>("direction")),
  // _rhos(getParam<Real>("charge_density")),
  // _eps(getParam<Real>("epsilon"))
{
}

Real
GaussBC::computeQpResidual()
{
  RealVectorValue _field(_field_0[_qp],_field_1[_qp],_field_2[_qp]);

  return  _field * _normal;

}
