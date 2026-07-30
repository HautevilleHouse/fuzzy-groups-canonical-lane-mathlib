import canonicalLaneMathlib.AdmissibleClass
import FuzzyGroupsCanonicalLaneLean.FuzzyGroupObjects

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure AdmissibleClass where
  object : FuzzyGroupAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse