import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyProductTheorem {G H : Type u} [Group G] [Group H]
    (FG : FuzzySubgroupMembership G) (FH : FuzzySubgroupMembership H) where
  productFuzzySubgroup : FuzzySubgroupMembership (G × H)
  projection1 : FuzzyHomomorphism FG (productFuzzySubgroup)
  projection2 : FuzzyHomomorphism FH (productFuzzySubgroup)
  universalProperty : Prop

structure FuzzyProductTheoremEvidence {G H : Type u} [Group G] [Group H]
    {FG : FuzzySubgroupMembership G} {FH : FuzzySubgroupMembership H}
    (P : FuzzyProductTheorem FG FH) where
  universalPropertyClosed : P.universalProperty

def FuzzyProductTheoremClosed {G H : Type u} [Group G] [Group H]
    {FG : FuzzySubgroupMembership G} {FH : FuzzySubgroupMembership H}
    (P : FuzzyProductTheorem FG FH) : Prop :=
  P.universalProperty

theorem fuzzy_product_theorem_closed_from_evidence {G H : Type u} [Group G] [Group H]
    {FG : FuzzySubgroupMembership G} {FH : FuzzySubgroupMembership H}
    (P : FuzzyProductTheorem FG FH) (E : FuzzyProductTheoremEvidence P) :
    FuzzyProductTheoremClosed P :=
  E.universalPropertyClosed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse