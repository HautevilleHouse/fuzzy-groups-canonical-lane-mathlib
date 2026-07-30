import canonicalLaneMathlib.AdmissibleClass
import FuzzyGroupsCanonicalLaneLean.FuzzyGroupBridgeLemmas

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse