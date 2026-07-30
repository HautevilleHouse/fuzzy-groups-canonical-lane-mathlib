import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupPackage

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyLagrangePackage (F G : FuzzySubgroupPackage) where
  supergroup : G
  subgroup : F
  membershipSummation : Prop
  lagrangeInequality : Prop

structure FuzzyLagrangeEvidence {F G : FuzzySubgroupPackage} (L : FuzzyLagrangePackage F G) where
  membershipSummationClosed : L.membershipSummation
  lagrangeInequalityClosed : L.lagrangeInequality

def FuzzyLagrangeClosed {F G : FuzzySubgroupPackage} (L : FuzzyLagrangePackage F G) : Prop :=
  L.membershipSummation ∧ L.lagrangeInequality

theorem fuzzy_lagrange_closed_from_evidence {F G : FuzzySubgroupPackage}
    (L : FuzzyLagrangePackage F G) (E : FuzzyLagrangeEvidence L) :
    FuzzyLagrangeClosed L := by
  exact And.intro E.membershipSummationClosed E.lagrangeInequalityClosed

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean