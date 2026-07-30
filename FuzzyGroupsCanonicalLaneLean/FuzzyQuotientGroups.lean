import canonicalLaneMathlib.AdmissibleClass
import FuzzyGroupsCanonicalLaneLean.FuzzyNormalSubgroups
import FuzzyGroupsCanonicalLaneLean.FuzzyCosets

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyQuotientGroup {G : Type u} [Group G] {H : FuzzySubgroup G}
    (N : FuzzyNormalSubgroup H) where
  carrier_setoid : Setoid G
  quotient_carrier : Quotient carrier_setoid → ℝ
  quotient_mul_compatible : ∀ a b : G, quotient_carrier (Quotient.mk (a * b)) ≥
    quotient_carrier (Quotient.mk a) * quotient_carrier (Quotient.mk b)

def FuzzyQuotientGroupClosed {G : Type u} [Group G] {H : FuzzySubgroup G}
    {N : FuzzyNormalSubgroup H} (Q : FuzzyQuotientGroup N) : Prop :=
  Q.quotient_mul_compatible

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
