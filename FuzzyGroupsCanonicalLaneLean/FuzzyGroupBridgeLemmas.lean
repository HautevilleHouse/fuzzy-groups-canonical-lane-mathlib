import canonicalLaneMathlib.AdmissibleClass
import FuzzyGroupsCanonicalLaneLean.FuzzyGroupObjects

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | FuzzyGroupAdmittedObject.mk X grp fg _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  trivial

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse